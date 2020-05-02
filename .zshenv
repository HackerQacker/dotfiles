# Environment variables
export SCRIPTSPATH=$HOME/Scripts
export PATH=$PATH:$SCRIPTSPATH

# Go envs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Work setups
export WORKPATH=$HOME/qd
if [ -d $WORKPATH ]
then
    source $WORKPATH/init/.zshrc
fi

# Aliases
alias logview='lnav'
alias clearfile='cat /dev/null > '
# For convenience
alias vim=nvim
alias vi=nvim

# Some zsh tools
autoload zcalc

# A fix for ruby permission issue (mainly relevant for macOS)
if which ruby >/dev/null && which gem >/dev/null; then PATH="$(ruby -rrubygems -e 'puts Gem.user_dir')/bin:$PATH" fi
