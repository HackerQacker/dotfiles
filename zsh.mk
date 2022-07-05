
setup: setup-zsh

setup-zsh: $(ANTIDOTE) $(PURE) $(PYENV) $(ZSH) link-zsh-env link-zsh-plugins
setup-zsh: SH_NAME=$(shell which zsh) 
setup-zsh: 
	$(call maybesudo, chsh -s $(SH_NAME) $(shell whoami))

ZSH = $(shell which zsh)
$(ZSH): $(PACAPT)
	$(call pacapt, install zsh)

PURE = $(shell which pure)
$(PURE):
	mkdir -p ${HOME}/.zsh
	git clone https://github.com/sindresorhus/pure.git ${HOME}/.zsh/pure

ANTIDOTE = ${HOME}/.antidote/antidote.zsh
ANTIDOTE:
	git clone https://github.com/mattmc3/antidote.git ${HOME}/.antidote

link-zsh-env:
	$(call backup, ${HOME}/.profile)
	ln -s -f ${CURDIR}/.profile ${HOME}
	$(call backup, ${HOME}/.zprofile)
	ln -s -f ${CURDIR}/.zprofile ${HOME}
	$(call backup, ${HOME}/.zshrc)
	ln -s -f ${CURDIR}/.zshrc ${HOME}
	$(call backup, ${HOME}/.zshenv)
	ln -s -f ${CURDIR}/.zshenv ${HOME}

link-zsh-plugins:
	$(call backup, ${HOME}/.zsh_plugins.txt)
	ln -s -f ${CURDIR}/.zsh_plugins.txt ${HOME}

PYENV = $(shell which pyenv)
$(PYENV):
	curl https://pyenv.run | bash
