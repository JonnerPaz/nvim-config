import os
import shutil
import subprocess
from pathlib import Path

from common import info, success, warn, header


def install_ohmyzsh():
    if Path.home().joinpath(".oh-my-zsh").is_dir():
        info("Oh My Zsh ya instalado")
        return
    header("Oh My Zsh")
    subprocess.run(
        'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended',
        shell=True,
        check=True,
    )
    success("Oh My Zsh instalado")


def install_zsh_plugins():
    custom_dir = Path(
        os.environ.get("ZSH_CUSTOM", str(Path.home() / ".oh-my-zsh" / "custom"))
    )
    plugin_dir = custom_dir / "plugins" / "zsh-syntax-highlighting"

    if plugin_dir.is_dir():
        info("zsh-syntax-highlighting ya instalado")
        return

    header("Plugin zsh-syntax-highlighting")
    subprocess.run(
        [
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/zsh-users/zsh-syntax-highlighting.git",
            str(plugin_dir),
        ],
        check=True,
    )
    success("zsh-syntax-highlighting instalado")


def set_default_shell():
    zsh_path = shutil.which("zsh")
    if not zsh_path:
        warn("zsh no encontrado")
        return

    current_shell = os.environ.get("SHELL", "")
    if current_shell == zsh_path:
        info("zsh ya es la shell por defecto")
        return

    info("Cambiando shell por defecto a zsh...")
    result = subprocess.run(
        ["chsh", "-s", zsh_path], capture_output=True, text=True
    )
    if result.returncode == 0:
        success("Shell cambiada a zsh (requiere reiniciar sesión)")
    else:
        warn(f"No se pudo cambiar la shell. Ejecuta: chsh -s {zsh_path}")


def install_shell():
    header("Shell")
    install_ohmyzsh()
    install_zsh_plugins()
    set_default_shell()
