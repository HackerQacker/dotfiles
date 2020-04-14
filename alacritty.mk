export ALACRITTY_PATH=${HOME}/.config/alacritty

setup: setup-alacritty

setup-alacritty: install-alacritty $(ALACRITTY_PATH) link-alacritty-config

link-alacritty-config: $(ALACRITTY_PATH)
	ln -s -f ${CURDIR}/alacritty.yml $(ALACRITTY_PATH)/alacritty.yml

install-alacritty: $(PACAPT)
	$(call pacapt, install alacritty)

$(ALACRITTY_PATH):
	mkdir -p $@
