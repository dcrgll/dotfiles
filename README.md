# dotfiles

Personal macOS dotfiles and app setup.

## What's Included

- zsh configuration
- Starship prompt configuration
- Zed settings
- Homebrew `Brewfile`

## Install Homebrew Packages

```sh
brew bundle --file Brewfile
```

## Symlink Config Files

From this repo, link the config files into `$HOME`:

```sh
mkdir -p "$HOME/.zsh" "$HOME/.config/zed"
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/.zprofile" "$HOME/.zprofile"
ln -sf "$PWD/.zsh/aliases.zsh" "$HOME/.zsh/aliases.zsh"
ln -sf "$PWD/.zsh/functions.zsh" "$HOME/.zsh/functions.zsh"
ln -sf "$PWD/.config/starship.toml" "$HOME/.config/starship.toml"
ln -sf "$PWD/.config/zed/settings.json" "$HOME/.config/zed/settings.json"
```

## asdf

asdf Node versions and plugins are managed separately from the `Brewfile`.
