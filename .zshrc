export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# clone antidote if necessary
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote

# source antidote
. ~/.antidote/antidote.zsh

# generate and source plugins from ~/.zsh_plugins.txt
antidote load

# Initialize prompt
# eval "$(starship init zsh)"
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set editor default keymap to vi
bindkey -v

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

zstyle ':completion:*' menu select

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

