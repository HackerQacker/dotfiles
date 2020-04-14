PACAPT=/usr/local/bin/pacapt

export OS_NAME := $(shell uname | tr '[:upper:]' '[:lower:]')

ifeq ($(OS_NAME), darwin)
define maybesudo
@echo 'On macOS, we should never run sudo, right..?'
$(1)
endef
else
define maybesudo
@echo 'Not on macOS, so SUDOing this command'
sudo $(1)
endef
endif

all: $(PACAPT)

$(PACAPT):
	$(call maybesudo, wget -O ${PACAPT} https://github.com/icy/pacapt/raw/ng/pacapt)
	$(call maybesudo, chmod 755 ${PACAPT})

define pacapt
$(call maybesudo, ${PACAPT} $(1))
endef

include ${CURDIR}/alacritty.mk
include ${CURDIR}/zsh.mk
include ${CURDIR}/tmux.mk
include ${CURDIR}/vim.mk

all: setup
