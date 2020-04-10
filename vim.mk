
NVIM_PLUG=${HOME}/.local/share/nvim/site/autoload/plug.vim
NVIM_CONFIG=${HOME}/.config/nvim

setup: setup-nvim

setup-nvim: install-nvim $(NVIM_PLUG) link-nviminit install-plugins

install-nvim: $(PACAPT)
	$(call pacapt, install neovim)

link-nviminit: $(NVIM_CONFIG)
	ln -s ${CURDIR}/init.vim $(NVIM_CONFIG)

install-plugins:
	nvim --headless +PlugInstall +qall
	nvim -c 'CocInstall -sync coc-python coc-go coc-json coc-yaml coc-clangd|q'

$(NVIM_PLUG):
	curl -fLo $@ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(NVIM_CONFIG):
	mkdir -p $@
