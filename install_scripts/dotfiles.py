import shutil
import time
from pathlib import Path

from common import info, success, warn, header, DOTFILES_DIR


def _backup_and_symlink_file(src, dest):
    if dest.exists() and not dest.is_symlink():
        backup = dest.with_name(f"{dest.name}.bak.{int(time.time())}")
        shutil.copy2(dest, backup)
        warn(f"Backup de {dest.name} creado")
    if dest.is_symlink() or dest.exists():
        dest.unlink()
    dest.symlink_to(src)


def _backup_and_symlink_dir(src, dest):
    if dest.is_dir() and not dest.is_symlink():
        backup = dest.with_name(f"{dest.name}.bak.{int(time.time())}")
        shutil.copytree(dest, backup)
        warn(f"Backup de {dest.name} config creado")
    if dest.is_symlink() or dest.exists():
        if dest.is_dir():
            shutil.rmtree(dest)
        else:
            dest.unlink()
    dest.symlink_to(src, target_is_directory=True)


def install_dotfiles():
    header("Dotfiles")

    if not DOTFILES_DIR.is_dir():
        info(f"Directorio de dotfiles no encontrado: {DOTFILES_DIR}")
        return

    home = Path.home()

    # Archivos de configuración principales
    for f in [".zshrc", ".zshenv", ".bashrc", ".gitconfig"]:
        src = DOTFILES_DIR / f
        dest = home / f
        _backup_and_symlink_file(src, dest)

    # .local/bin/env
    local_bin = home / ".local" / "bin"
    local_bin.mkdir(parents=True, exist_ok=True)
    env_src = DOTFILES_DIR / ".local" / "bin" / "env"
    env_dest = local_bin / "env"
    _backup_and_symlink_file(env_src, env_dest)

    # .config directories
    config_dir = home / ".config"
    config_dir.mkdir(parents=True, exist_ok=True)

    for subdir in ["nvim", "btop", "lazygit", "wezterm", "ghostty"]:
        src = DOTFILES_DIR / ".config" / subdir
        dest = config_dir / subdir
        if src.exists():
            _backup_and_symlink_dir(src, dest)

    success("Dotfiles instalados como symlinks")
