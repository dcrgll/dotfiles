#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WITH_BREW=0

usage() {
  cat <<'USAGE'
Usage: ./install.sh [--brew]

  Symlink dotfiles from this repo into $HOME.
  Pass --brew to also run `brew bundle --file homebrew/Brewfile`.
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --brew) WITH_BREW=1 ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

link() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"

  if [[ -L "$dest" ]]; then
    rm "$dest"
  elif [[ -e "$dest" ]]; then
    local backup="${dest}.bak.$(date +%Y%m%d%H%M%S)"
    echo "Backing up $dest -> $backup"
    mv "$dest" "$backup"
  fi

  ln -sf "$src" "$dest"
  echo "Linked $dest"
}

echo "Installing dotfiles from $DOTFILES_DIR"

mkdir -p "$HOME/.zsh/cache" "$HOME/.config/zed" "$HOME/.config/ghostty/themes"

link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
link "$DOTFILES_DIR/.hushlogin" "$HOME/.hushlogin"
link "$DOTFILES_DIR/.editorconfig" "$HOME/.editorconfig"
link "$DOTFILES_DIR/.zsh/aliases.zsh" "$HOME/.zsh/aliases.zsh"
link "$DOTFILES_DIR/.zsh/functions.zsh" "$HOME/.zsh/functions.zsh"
link "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"
link "$DOTFILES_DIR/.config/zed/settings.json" "$HOME/.config/zed/settings.json"
link "$DOTFILES_DIR/.config/ghostty/config.ghostty" "$HOME/.config/ghostty/config.ghostty"
link "$DOTFILES_DIR/.config/ghostty/themes/dark" "$HOME/.config/ghostty/themes/dark"
link "$DOTFILES_DIR/.config/ghostty/themes/light" "$HOME/.config/ghostty/themes/light"

# App Support config loads after XDG on macOS and would override it
app_support_ghostty="$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
if [[ -e "$app_support_ghostty" && ! -L "$app_support_ghostty" ]]; then
  backup="${app_support_ghostty}.bak.$(date +%Y%m%d%H%M%S)"
  echo "Backing up $app_support_ghostty -> $backup"
  mv "$app_support_ghostty" "$backup"
fi

if [[ "$WITH_BREW" -eq 1 ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Install it from https://brew.sh then re-run with --brew." >&2
    exit 1
  fi
  echo "Running brew bundle..."
  brew bundle --file "$DOTFILES_DIR/homebrew/Brewfile"
fi

echo "Done. Open a new shell (or run: exec zsh) to pick up changes."
