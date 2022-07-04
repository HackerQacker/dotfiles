# export OMZSH_PATH=${HOME}/.oh-my-zsh

setup: setup-zsh

setup-zsh: $(PURE) $(PYENV) $(ZSH) link-zsh-env link-zsh-plugins
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

# link-starship-toml:
# 	mkdir -p ${HOME}/.config
# 	$(call backup, ${HOME}/.config/starship.toml)
# 	ln -s -f ${CURDIR}/starship.toml ${HOME}/.config

PYENV = $(shell which pyenv)
$(PYENV):
	curl https://pyenv.run | bash
