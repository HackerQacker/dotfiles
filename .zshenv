# Environment variables
export SCRIPTSPATH=$HOME/mybin
export PATH=$PATH:$SCRIPTSPATH

# Go envs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Python Poetry
export PATH="$HOME/.poetry/bin:$PATH"

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
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --no-ignore --follow'

# My FZF bookmarks - can be extended
export FZF_BOOKMARKS=(
	"$HOME"
	"$HOME/projs/my"
	"$HOME/projs/my/dotfiles"
)

function _print_bm() { printf "%s\n" "${FZF_BOOKMARKS[@]}" }
function bm() {	_print_bm | fzf}
function cdb() {
	local p
	local errcode
	p=$(bm)
	errcode=$?
	if [ $errcode -eq 0 ]; then
		cd $p
	fi
	return $errcode
}

# Android env
export ANDROID_HOME=$HOME/Library/Android

# Work setups
export WORKPATH=$HOME/work
if [ -d $WORKPATH/init ]
then
    source $WORKPATH/init/.zshenv
fi
