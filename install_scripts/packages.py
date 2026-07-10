import os
import subprocess

from common import info, success, header


def install_system_packages(pm):
    # essential packages
    pkgs = [
        "git",
        "curl",
        "wget",
        "unzip",
        "tar",
        "gzip",
        "zsh",
        "chafa",
    ]

    if os.environ.get("WAYLAND_DISPLAY"):
        pkgs.append("wl-clipboard")
    else:
        pkgs.append("xclip")

    header("Paquetes del sistema")
    info(f"Instalando con {pm}: {' '.join(pkgs)}")

    cmd_map = {
        "apt": ["sudo", "apt-get", "update", "-qq"],
        "dnf": None,
    }

    if pm == "apt":
        subprocess.run(cmd_map[pm], check=True)
        subprocess.run(
            ["sudo", "apt-get", "install", "-y", "-qq"] + pkgs, check=True
        )
    elif pm == "dnf":
        subprocess.run(["sudo", "dnf", "install", "-y"] + pkgs, check=True)

    success("Paquetes del sistema instalados")
