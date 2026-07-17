# Login environment (PATH, Homebrew, EDITOR)

export EDITOR='zed'

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Personal bins before system/brew (mise shims come from `mise activate` in .zshrc)
path=(
  $HOME/bin
  $HOME/.local/bin
  $path
)
export PATH
