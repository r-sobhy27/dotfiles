stty intr ^E

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# some useful options (man zshoptions)
setopt menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
unsetopt BEEP

# completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.
# shift+tab
bindkey -M menuselect '^[[Z' reverse-menu-complete
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# FZF
export FZF_DEFAULT_OPTS='--no-height --layout=default'
export FZF_DEFAULT_COMMAND='fd . -tf --color=never'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# zsh vi-mode
bindkey -v
bindkey -M viins '^C' vi-cmd-mode

# Alias
alias l="ls -al"
alias ls="ls --color=auto"
alias vim="nvim"
alias lgit="lazygit"

PROMPT="%n@%m:%~$ "
