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

alias gitc="find . -type f -size +100000k -exec ls -lh {} \; | awk '{ print \$9 \": \" \$5 }'"

alias sc="cd ~/Documents/Git_Repos/School/Winter2021/"

alias ll="kitty -e latexmk -pdf -pvc"
