# Environment variables
export SCRIPTSPATH=$HOME/mybin
export PATH=$PATH:$SCRIPTSPATH

# Go envs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Work setups
export WORKPATH=$HOME/work
if [ -d $WORKPATH/init ]
then
    source $WORKPATH/init/.zshenv
fi

# Aliases
alias clearfile='cat /dev/null > '

# For convenience
alias vim=nvim
alias vi=nvim
export VISUAL=nvim

# Some zsh tools
autoload zcalc

# A fix for ruby permission issue (mainly relevant for macOS)
if which ruby >/dev/null && which gem >/dev/null; then PATH="$(ruby -rrubygems -e 'puts Gem.user_dir')/bin:$PATH" fi

# Some FZF setup
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --no-ignore --follow'
