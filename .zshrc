export LC_CTYPE=UTF-8

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

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completionI

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/omer/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
