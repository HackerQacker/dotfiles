

#####
# IMPORTANT!
# You simply cannot automatically install yabai.. So keep it in mind
#####

export YABAIRC=${HOME}/.config/yabai/yabairc
export SKHDRC=${HOME}/.config/skhd/skhdrc

setup: $(SKHDRC) $(YABAIRC)

$(YABAIRC):
	mkdir -p ${HOME}/.config/yabai
	ln -s -f ${CURDIR}/yabairc ${HOME}/.config/yabai

$(SKHDRC):
	mkdir -p ${HOME}/.config/skhd
	ln -s -f ${CURDIR}/skhdrc ${HOME}/.config/skhd

# TODO:
# Add the helper scripts to $PATH
