if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

fish_add_path /home/chris/.config/fish/functions/

# Make fish reopen in last directory
function save_last_pwd --on-event fish_postexec
    echo $PWD > /tmp/whereami
end

bind \e\r accept-autosuggestion

starship init fish | source

############## ALIASES ##############
# make grep output colorful 
alias grep='grep --color=auto'

# Use neovims
alias vim='nvim'
alias npvim='nvim --clean' # No vimrc

# GDB-like bindings
alias q='exit'

# Yay easy mode
alias yaay='yay --noconfirm --sudoloop -Sy --overwrite "*"'

alias rm="echo 'Use rip instead of rm'"
alias do_perf="perf record -F max -g --call-graph fp"
alias fclear="printf '\033[2J\033[3J\033[1;1H'"

alias nvide="hyprctl keyword misc:enable_swallow true; \
            neovide &; sleep 1 && \
            hyprctl keyword misc:enable_swallow false"


function update_pkg
    set pkgs $(yay -Q | grep $argv | cut -d ' ' -f 1 | paste -sd " " -)
    echo "Updating $pkgs"

    echo "Do you want to update these packages? [Y/n]: "
    read -l USER_INPUT

    if test -z "$USER_INPUT"
        set USER_INPUT "Y"
    end
# Check user input and handle file replacement
    switch "$USER_INPUT"
        case Y y
            # Update packages
            echo "Updating $pkgs"
            yay -Sy $pkgs
        case N n '*'
            echo "Aborting update."
    end
end

function last_history_item
    echo $history[1]
end

abbr -a !! --position anywhere --function last_history_item

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
