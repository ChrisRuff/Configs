import os
import subprocess
import argparse
import shutil

packages = ["neovim", "neofetch", "kitty"]
root = os.path.dirname(__file__)


config_map = {
    "nvim": "nvim",
    "i3": "i3",
    "ranger": "ranger",
    "redshift": "redshift",
    "gtk": "gtk-3.0",
    "kitty": "kitty",
    "btop": "btop",
    "clamav": "clamav",
    "code": "Code",
    "hypr": "hypr",
    "mangohud": "MangoHud",
    "fish": "fish",
    "neofetch": "neofetch",
    "neovide": "neovide",
    "waybar": "waybar",
}

def print_header(title):
    print("#########", title, "#########")

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

def check_for_mismatch(config_path, sys_path):
    if not os.path.exists(sys_path):
        return True
    
    with open(config_path, 'rb') as f1, open(sys_path, 'rb') as f2:
        content1 = f1.read()
        content2 = f2.read()
        
    return content1 != content2

def place_config(config_path, sys_path, overwrite=False, dry_run=False):
    if os.path.exists(sys_path):
        if check_for_mismatch(config_path, sys_path):
            print_header("CONFIG MISMATCH")
            print("Mismatch", config_path, "and", sys_path, ", please sync them and rerun this script")
            return
    else:
        print(config_path, "->", sys_path)
        if not dry_run:
            shutil.copy(config_path, sys_path)

def place_configs(config_path, sys_path, overwrite=False, dry_run=False):
    os.makedirs(sys_path, exist_ok=True)
    files = get_files(config_path)
    for file in files:
        dir = [get_path(os.path.join(config_path, file)), 
                os.path.join(sys_path,file)]
        place_config(dir[0], dir[1], overwrite, dry_run)
        

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
    for item, path in config_map.items():
        place_configs(item, expand_home(f".config/{path}"), overwrite, dry_run)

    os.makedirs(expand_home(".config/i3status"), exist_ok=True)
    place_config(get_path("i3/i3status.conf"), expand_home(".config/i3status/config"), overwrite, dry_run)

def sync_config(sys_path, config_path):
    if not os.path.exists(sys_path):
        print_header("SYSTEM CONFIG DOES NOT EXIST")
        print("Missing", sys_path)
        return
    elif os.path.exists(config_path):
        if check_for_mismatch(config_path, sys_path):
            print("Syncing:", sys_path, "->", config_path)

            os.remove(config_path)
            shutil.copy(sys_path, config_path)
    else:
        print_header("THIS REPO'S CONFIG DOES NOT EXIST")
        print("Missing", config_path)
        return

def sync_configs(sys_path, config_path):
    files = get_files(get_path(config_path))
    for file in files:
        dir = [os.path.join(sys_path,file),
               get_path(os.path.join(config_path, file))]
        sync_config(dir[0], dir[1])

def sync():
    print_header("Syncing Configs")
    for item, path in config_map.items():
        sync_configs(expand_home(f".config/{path}"), item)

    sync_config(expand_home(".config/i3status/config"), "i3/i3status.conf")
    print_header("Done Syncing Configs")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Configure system settings and create symlinks')
    parser.add_argument('--overwrite', '-o', action='store_true', default=False,
                        help='Overwrite existing config files')
    parser.add_argument('--download', '-d', action='store_true', default=False,
                        help='Download and install packages')
    parser.add_argument('--sync', '-s', action='store_true', default=False,
                        help='Sync config files with system')
    parser.add_argument('--dry-run', '-n', action='store_true', default=False,
                        help='Do not create symlinks or download packages, just print what would be done')
    args = parser.parse_args()

    if args.sync:
        sync()

    else:
        if args.download:
            download(args.dry_run)
        
        links(args.overwrite, args.dry_run)
