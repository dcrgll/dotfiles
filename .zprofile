# Login environment (PATH, Homebrew)

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Personal bins, then asdf shims (so versioned tools win over system/brew)
path=(
  $HOME/bin
  $HOME/.local/bin
  ${ASDF_DATA_DIR:-$HOME/.asdf}/shims
  $path
)
export PATH
