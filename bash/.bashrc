. ~/.bash_aliases
export PROMPT_COMMAND="pwd > /tmp/whereami "
export PS1="[\[$(tput sgr0)\]\[\033[38;5;85m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;82m\]\u\[$(tput sgr0)\]\[\033[38;5;211m\] \w]\[\033[38;5;15m\]\\$ \[\033[38;5;83m\]\@\n>>> \[$(tput sgr0)\]"

export PATH='$HOME/.local/bin':$PATH

# UE5
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
export PATH=$PATH:'/home/games/Unreal/UnrealEngine/Engine/Binaries/Linux/'

# CMAKE
#export CMAKE_GENERATOR="Ninja"
export CMAKE_GENERATOR="Unix Makefiles"

# BASH HISTORY
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="[%F %T]"
export HISTFILE=~/.bash_external_history
export PROMPT_COMMAND="${PROMPT_COMMAND} && history -a; $PROMPT_COMMAND"

# Conan fix
export NOT_ON_C3I=1

export ALICEVISION_ROOT=/usr

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
#

. "/opt/asdf-vm/asdf.sh"
