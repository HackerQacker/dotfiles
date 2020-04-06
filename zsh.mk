export OMHZSH_PATH=${HOME}/.oh-my-zsh

setup: setup-zsh

setup-zsh: install-zsh $(OMHZSH_PATH) link-zsh-env
setup-zsh: SH_NAME=$(shell which zsh) 
setup-zsh: 
	chsh -s $(SH_NAME)

install-zsh: $(PACAPT)
	$(call pacapt, install zsh)

$(OMHZSH_PATH):
	$(CURDIR)/install_omzsh.sh

link-zsh-env:
	# -f bacause installation of oh-my-zsh already creates one
	ln -s -f ${CURDIR}/.zshrc ${HOME}
	ln -s ${CURDIR}/.zshenv ${HOME}

