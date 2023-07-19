
NVIM_CONFIG=${HOME}/.config/nvim

setup: setup-nvim

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

link-ideavim:
	ln -s -f ${CURDIR}/.ideavimrc ${HOME}

install-plugins:
	nvim --headless +'PlugInstall --sync' +'PlugUpdate' +'qall'
	nvim --headless +'CocInstall -sync' +'CocUpdateSync|q'

$(NVIM_CONFIG):
	ln -s -f ${CURDIR}/nvim $(NVIM_CONFIG)
