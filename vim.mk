
NVIM_PLUG=${HOME}/.local/share/nvim/site/autoload/plug.vim
NVIM_CONFIG=${HOME}/.config/nvim

setup: setup-nvim

setup-nvim: install-yarn install-nvim $(NVIM_PLUG) link-nviminit install-plugins

install-yarn: $(PACAPT)
	$(call pacapt, install yarn)

install-nvim: $(PACAPT)
	$(call pacapt, install neovim)

link-nviminit: $(NVIM_CONFIG)
	$(call backup, ${NVIM_CONFIG}/init.vim})
	ln -s -f ${CURDIR}/init.vim $(NVIM_CONFIG)

install-plugins:
	nvim --headless +PlugInstall +qall

$(NVIM_PLUG):
	curl -fLo $@ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(NVIM_CONFIG):
	mkdir -p $@
