
NVIM_PLUG=${HOME}/.local/share/nvim/site/autoload/plug.vim
NVIM_CONFIG=${HOME}/.config/nvim

setup: setup-nvim

setup-nvim: install-nvim $(NVIM_PLUG) link-nviminit

install-nvim: $(PACAPT)
	$(call pacapt, install nvim)

link-nviminit: $(NVIM_CONFIG)
	ln -s ${CURDIR}/init.vim $(NVIM_CONFIG)

$(NVIM_PLUG):
	curl -fLo $@ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(NVIM_CONFIG):
	mkdir -p $@
