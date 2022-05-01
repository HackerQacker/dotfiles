# Environment variables
export SCRIPTSPATH=$HOME/mybin
export PATH=$PATH:$SCRIPTSPATH

# Go envs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Python Poetry
export PATH="$HOME/.poetry/bin:$PATH"

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt auto_cd
setopt multios
setopt prompt_subst

# Aliases
alias clearfile='cat /dev/null > '

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -- -='cd -'

# List directory contents
alias ls='ls --color'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

export VISUAL=nvim
alias vim=nvim
alias vi=nvim
alias v=nvim

# Some zsh tools
autoload zcalc

# A fix for ruby permission issue (mainly relevant for macOS)
if which ruby >/dev/null && which gem >/dev/null; then PATH="$(ruby -rrubygems -e 'puts Gem.user_dir')/bin:$PATH" fi

# Some FZF setup
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --no-ignore --follow'
# export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'

# Android env
export ANDROID_HOME=$HOME/Library/Android

# Work setups
export WORKPATH=$HOME/work
if [ -d $WORKPATH/init ]
then
    source $WORKPATH/init/.zshenv
fi
