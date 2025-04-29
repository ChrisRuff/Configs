import os
import subprocess
import argparse

packages = ["neovim", "neofetch", "kitty"]
root = os.path.dirname(__file__)
def get_path(path):
    return os.path.join(root, path)
def expand_home(path):
    return os.path.join(os.path.expanduser("~"), path)

def get_files(path):
    files = []
    for file in os.listdir(path):
        if os.path.isfile(os.path.join(path, file)):
            files.append(file)
        elif os.path.isdir(os.path.join(path, file)):
            files.extend([os.path.join(file, x) for x in get_files(os.path.join(path, file))])
    return files

def place_config(config_path, sys_path, overwrite=False, dry_run=False):
    if os.path.exists(sys_path) and overwrite:
        print("Removing", sys_path)
        os.remove(sys_path)
        
    print(config_path, "->", sys_path)
    if not dry_run:
        os.link(get_path(config_path), expand_home(sys_path))

def place_configs(config_path, sys_path, overwrite=False, dry_run=False):
    os.makedirs(sys_path, exist_ok=True)
    files = get_files(config_path)
    for file in files:
        dir = [get_path(os.path.join(config_path, file)), 
                os.path.join(sys_path,file)]
        place_config(dir[0], dir[1], overwrite, dry_run)
        
def print_header(title):
    print("#########", title, "#########")

def download(dry_run=False):
    print_header("Downloading Packages")
    def run_command(command, cwd=None):
        if args.dry_run:
            print(" ".join(command))
        else:
            subprocess.call(command, cwd=cwd)

    run_command(["sudo", "pacman", "--noconfirm", "-S", "base-devel"])
    run_command(["git", "clone", "https://aur.archlinux.org/yay.git", "/tmp/yay"])
    run_command(["makepkg", "-si", "--noconfirm"], cwd="/tmp/yay")
    run_command(["yay", "--noconfirm", "--sudoloop", "-S"] + packages)

def links(overwrite=False, dry_run=False):
    print_header("Creating Symlinks")
    place_configs("nvim", expand_home(".config/nvim"), overwrite, dry_run)
    place_configs("i3", expand_home(".config/i3"), overwrite, dry_run)
    place_configs("ranger", expand_home(".config/ranger"), overwrite, dry_run)
    place_configs("redshift", expand_home(".config/redshift"), overwrite, dry_run)
    place_configs("intellij", expand_home(""), overwrite, dry_run)
    place_configs("bash", expand_home(""), overwrite, dry_run)
    place_configs("xresources", expand_home(""), overwrite, dry_run)
    place_configs("picom", expand_home(".config"), overwrite, dry_run)
    place_configs("gtk", expand_home(".config/gtk-3.0"), overwrite, dry_run)
    place_configs("kitty", expand_home(".config/kitty"), overwrite, dry_run)
    place_configs("latex", expand_home(""), overwrite, dry_run)
    place_configs("git", expand_home(""), overwrite, dry_run)
    place_configs("btop", expand_home(".config/btop"), overwrite, dry_run)
    place_configs("clamav", expand_home(".config/clamav"), overwrite, dry_run)
    place_configs("code", expand_home(".config/Code"), overwrite, dry_run)
    place_configs("hypr", expand_home(".config/hypr"), overwrite, dry_run)
    place_configs("mangohud", expand_home(".config/MangoHud"), overwrite, dry_run)
    place_configs("fish", expand_home(".config/fish"), overwrite, dry_run)
    place_configs("neofetch", expand_home(".config/neofetch"), overwrite, dry_run)
    place_configs("neovide", expand_home(".config/neovide"), overwrite, dry_run)
    place_configs("waybar", expand_home(".config/waybar"), overwrite, dry_run)

    os.makedirs(expand_home(".config/i3status"), exist_ok=True)
    place_config(get_path("i3/i3status.conf"), expand_home(".config/i3status/config"), overwrite, dry_run)



if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Configure system settings and create symlinks')
    parser.add_argument('--overwrite', '-o', action='store_true', default=False,
                        help='Overwrite existing config files')
    parser.add_argument('--download', '-d', action='store_true', default=True,
                        help='Download and install packages')
    parser.add_argument('--dry-run', '-n', action='store_true', default=False,
                        help='Do not create symlinks or download packages, just print what would be done')
    args = parser.parse_args()
    
    if args.download:
        download(args.dry_run)
    
    links(args.overwrite, args.dry_run)
