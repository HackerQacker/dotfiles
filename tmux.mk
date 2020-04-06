export TMUX_PLUGIN_MANAGER_PATH:=${HOME}/.tmux/plugins

setup: setup-tmux

setup-tmux: install-tmux link-tmuxconf $(TMUX_PLUGIN_MANAGER_PATH)

install-tmux: $(PACAPT)
	$(call pacapt, install tmux)

# install anyway
link-tmuxconf:
	ln -s ${CURDIR}/.tmux.conf ${HOME}

$(TMUX_PLUGIN_MANAGER_PATH):
	git clone https://github.com/tmux-plugins/tpm $@/tpm
	$@/tpm/bin/install_plugins
