. ~/.bash_aliases
export PROMPT_COMMAND="pwd > /tmp/whereami"
export PS1="[\[$(tput sgr0)\]\[\033[38;5;85m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;82m\]\u\[$(tput sgr0)\]\[\033[38;5;211m\] \w]\[\033[38;5;15m\]\\$ \[\033[38;5;83m\]\@\n>>> \[$(tput sgr0)\]"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
