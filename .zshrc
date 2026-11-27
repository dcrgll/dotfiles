# Interactive shell — history, completion, aliases, prompt

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Completion
autoload -Uz compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:::::' completer _expand _complete _ignored _approximate
compinit

# Aliases and functions
[[ -f $HOME/.zsh/aliases.zsh ]] && source $HOME/.zsh/aliases.zsh
[[ -f $HOME/.zsh/functions.zsh ]] && source $HOME/.zsh/functions.zsh
[[ -f $HOME/.zsh/cleo.zsh ]] && source $HOME/.zsh/cleo.zsh

# Plugins (Homebrew) - local sessions only
if [[ -z "$SSH_CONNECTION" && -n "$HOMEBREW_PREFIX" ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi

# SSH session tweaks
if [[ -n "$SSH_CONNECTION" ]]; then
  export ZSH_DISABLE_COMPFIX=true
  DISABLE_AUTO_UPDATE=true
fi

# Prompt
eval "$(starship init zsh)"
eval "$(mise activate zsh)"
eval "$(/opt/homebrew/bin/zsh-patina activate)"
