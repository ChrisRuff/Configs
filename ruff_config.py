import os
import subprocess

packages = ["redshift", "google-chrome", "ranger", "fontforge", 
        "gitkraken", "vim-devicons", "neovim", "flameshot", "peek", 
        "neofetch", "kitty", "picom"]
root = os.path.dirname(__file__)
def get_path(path):
    return os.path.join(root, path)
def expand_home(path):
    return os.path.join(os.path.expanduser("~"), path)

def place_configs(config_path, sys_path):
    os.makedirs(sys_path, exist_ok=True)
    for file in os.listdir(config_path):
        dir = [get_path(os.path.join(config_path, file)), 
                os.path.join(sys_path,file)]
        place_config(dir[0], dir[1])
        
def place_config(config_path, sys_path):
    try:
        os.remove(expand_home(sys_path))
    except:
        pass
    print(config_path, "->", sys_path)
    os.symlink(get_path(config_path), expand_home(sys_path))

def print_header(title):
    print("#########", title, "#########")

def download():
    print_header("Downloading Packages")
    subprocess.call(["sudo", "pacman", "--noconfirm", "-S", "base-devel"])
    subprocess.call(["git", "clone", "https://aur.archlinux.org/yay.git", "/tmp/yay"])
    subprocess.call(["makepkg", "-si", "--noconfirm"], cwd="/tmp/yay")
    subprocess.call(["yay", "--noconfirm", "--sudoloop", "-S"] + packages)

def sym_links():
    print_header("Creating Symlinks")
    place_configs("NVim", expand_home(".config/nvim"))
    place_configs("i3", expand_home(".config/i3"))
    place_configs("Ranger", expand_home(".config/ranger"))
    place_configs("Redshift", expand_home(".config/redshift"))
    place_configs("Intellij", expand_home(""))
    place_configs("Bashrc_Additions", expand_home(""))
    place_configs("XResources", expand_home(""))
    place_configs("Picom", expand_home(".config"))
    place_configs("GTK", expand_home(".config/gtk-3.0"))
    place_configs("Kitty", expand_home(".config/kitty"))
    place_configs("Latex", expand_home(""))
    place_configs("Git", expand_home(""))

    os.makedirs(expand_home(".config/i3status"), exist_ok=True)
    place_config(get_path("i3/i3status.conf"), expand_home(".config/i3status/config"))



if __name__ == "__main__":
    #download()
    sym_links()
