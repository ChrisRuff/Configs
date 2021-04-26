#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export QSYS_ROOTDIR="/home/chris/.cache/yay/quartus-standard/pkg/quartus-standard/opt/altera/quartus/sopc_builder/bin"
export PROMPT_COMMAND="pwd > /tmp/whereami"
export PATH=$PATH:/home/chris/.bin
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/include/python3.7m"

PATH=$PATH:$HOME/.vim/plugin
EDITOR="vim"
