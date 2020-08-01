# make grep output colorful 
alias grep='grep --color=auto'

# Open vimb in tabs
alias vimb='tabbed -c vimb -e'

# Use neovims
alias vim='nvim'
alias npvim='nvim --clean' # No vimrc

# GDB-like bindings
alias q='exit'

# Yay easy mode
alias yaay="yay --noconfirm --sudoloop"

# Start ranger in a terminal before launching it
alias ranger="i3-sensible-terminal -e ranger"

alias gitc="find . -type f -size +100000k -exec ls -lh {} \; | awk '{ print \$9 \": \" \$5 }'"

alias sc="cd ~/Documents/Git_Repos/School/Summer2020"
