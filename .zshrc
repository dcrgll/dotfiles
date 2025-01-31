# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  zsh-autosuggestions
)

# Zsh Syntax Highlighting
source "$HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load zsh-completions
autoload -U compinit && compinit

# Starship prompt
eval "$(starship init zsh)"

# ASDF version manager
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

# PNPM setup
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Bun setup
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Aliases
alias ip="ipconfig getifaddr en0"

# Git aliases
alias gits="git status"
alias gitd="git diff"
alias gitl="git lg"
alias gita="git add ."

# VS Code
alias c="code ."

# Open GitKraken in the current directory
kraken() {
	~/../../Applications/GitKraken.app/Contents/MacOS/GitKraken -p "$(pwd)"
}

# Create a new Next.js project
cna() {
  pnpx create-next-app@latest "$1" --empty --ts --use-pnpm --src-dir --app --eslint --tailwind --turbopack --import-alias '@/*'
  if [ $? -eq 0 ]; then
    cd "$1" || { echo "Failed to change directory to $1"; return; }
    code .
  fi
}
