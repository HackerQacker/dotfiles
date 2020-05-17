
NVIM_PLUG=${HOME}/.local/share/nvim/site/autoload/plug.vim
NVIM_CONFIG=${HOME}/.config/nvim

setup: setup-nvim

setup-nvim: install-nvim install-yarn $(NVIM_PLUG) link-nviminit install-plugins
setup-nvim: link-ideavim

install-nvim: $(PACAPT)
	$(call pacapt, install neovim)

# Reuired for some plugins
install-yarn: $(PACAPT)
	$(call pacapt, install yarn)

link-nviminit: $(NVIM_CONFIG)
	ln -s ${CURDIR}/init.vim $(NVIM_CONFIG)

link-ideavim:
	ln -s ${CURDIR}/.ideavimrc ${HOME}

install-plugins:
	nvim --headless +'PlugInstall --sync' +'PlugUpdate' +'qall'
	nvim --headless +'CocInstall -sync' +'CocUpdateSync|q'

$(NVIM_PLUG):
	curl -fLo $@ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(NVIM_CONFIG):
	mkdir -p $@
