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

# Latex configuration
alias ll="kitty -e latexmk -pdf -pvc"

# Ledger
alias networth="/home/chris/Documents/obsidian_vault/Journal/report \
  -f /home/chris/Documents/obsidian_vault/Journal/ledger.ledger \
  -J reg Assets ^Liabilities"

# Jetbrains toolbox
alias jetbrains="/opt/jetbrains-toolbox-1.21.9712/jetbrains-toolbox"
alias clion="~/.local/share/JetBrains/Toolbox/apps/CLion/ch-1/223.8617.54/bin/clion.sh"

alias keystroke="/home/chris/.scripts/keystroke"
