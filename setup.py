#! /usr/bin/env python

import os
import subprocess
from pathlib import Path

HOME = os.getenv("HOME") or exit(1)
CONFIG = os.getenv("XDG_CONFIG_HOME") or HOME + "/.config"
DATA = os.getenv("XDG_DATA_HOME") or HOME + "/.local"
CURRENT = str(Path(os.path.realpath(__file__)).parent.absolute())

def link(source_path, target_path):
    if os.path.exists(target_path):
        ret = input(target_path + " already exists! delete it ? [Y/n]: ")

        if ret == "Y" or ret == "y" or ret == "yes" or ret == "":
            os.remove(target_path)
            print("linking", source_path, "->", target_path)
            subprocess.run(["ln", "-s", source_path, target_path])
        elif ret == "N" or ret == "n" or ret == "no":
            return
        else:
            print("[ERROR] unkown input try again:")
            link(source_path, target_path)
    else:
        print("linking", source_path, "->", target_path)
        subprocess.run(["ln", "-s", source_path, target_path])

link(CURRENT + "/.zshrc", HOME + "/.zshrc")
link(CURRENT + "/awesome", CONFIG + "/awesome")
link(CURRENT + "/.tmux.conf", HOME + "/.tmux.conf")
link(CURRENT + "/alacritty", CONFIG + "/alacritty")
link(CURRENT + "/scripts", DATA + "/scripts")
link(CURRENT + "/nvim", CONFIG + "/nvim")
