export LC_CTYPE=UTF-8

# Initialize prompt
# eval "$(starship init zsh)"
autoload -U promptinit; promptinit
prompt pure

# clone antidote if necessary
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote

# source antidote
. ~/.antidote/antidote.zsh

# generate and source plugins from ~/.zsh_plugins.txt
antidote load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

eval "$(pyenv init -)"

zstyle ':completion:*' menu select
