
NVIM_PLUG=${HOME}/.local/share/nvim/site/autoload/plug.vim
NVIM_CONFIG=${HOME}/.config/nvim

setup: setup-nvim

setup-nvim: install-yarn install-nvim install-pynvim $(NVIM_PLUG) link-nviminit install-plugins
setup-nvim: install-yarn install-nvim install-pynvim $(NVIM_CONFIG)
setup-nvim: link-ideavim

install-nvim: $(PACAPT)
	$(call pacapt, install neovim)

# Reuired for some plugins
install-yarn: $(PACAPT)
	$(call pacapt, install yarn)

install-pynvim:
	$(call pacapt, install python3)
	python3 -m pip install pynvim

link-nviminit: $(NVIM_CONFIG)
	$(call backup, ${NVIM_CONFIG}/init.vim})
	ln -s -f ${CURDIR}/init.vim $(NVIM_CONFIG)

link-nviminit-lua: 
	# $(call backup, ${NVIM_CONFIG}/init.vim})

link-ideavim:
	ln -s -f ${CURDIR}/.ideavimrc ${HOME}

install-plugins:
	nvim --headless +'PlugInstall --sync' +'PlugUpdate' +'qall'
	nvim --headless +'CocInstall -sync' +'CocUpdateSync|q'

$(NVIM_PLUG):
	curl -fLo $@ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(NVIM_CONFIG):
	ln -s -f ${CURDIR}/nvim $(NVIM_CONFIG)
