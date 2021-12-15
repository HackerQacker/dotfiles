export OMZSH_PATH=${HOME}/.oh-my-zsh

setup: setup-zsh

setup-zsh: $(ZSH) $(OMZSH_PATH) link-zsh-env
setup-zsh: SH_NAME=$(shell which zsh) 
setup-zsh: 
	$(call maybesudo, chsh -s $(SH_NAME) $(shell whoami))

ZSH = $(shell which zsh)
$(ZSH): $(PACAPT)
	$(call pacapt, install zsh)

$(OMZSH_PATH):
	$(CURDIR)/install_omzsh.sh

link-zsh-env:
	$(call backup, ${HOME}/.zshrc)
	# -f bacause installation of oh-my-zsh already creates one
	ln -s -f ${CURDIR}/.zshrc ${HOME}
	$(call backup, ${HOME}/.zshenv)
	ln -s -f ${CURDIR}/.zshenv ${HOME}

