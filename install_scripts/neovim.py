import shutil
import subprocess
import tarfile
import urllib.request
from pathlib import Path

from common import info, success, header, BIN_DIR


def install_neovim(pm="dnf"):
    if shutil.which("nvim"):
        info("neovim ya instalado")
        return

    header("Neovim")

    if pm == "dnf":
        subprocess.run(
            "sudo dnf install neovim -y",
            shell=True,
            check=True,
        )
        success("neovim instalado")
        return

    # apt install
    url = "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
    tar_path = Path("/tmp/nvim-linux64.tar.gz")
    extract_dir = Path("/tmp")

    try:
        urllib.request.urlretrieve(url, tar_path)
    except Exception as e:
        info(f"Error descargando Neovim: {e}")
        return

    with tarfile.open(tar_path, "r:gz") as tar:
        tar.extractall(path=extract_dir)

    nvim_dir = Path.home() / ".local" / "nvim"
    extracted = extract_dir / "nvim-linux64"

    if nvim_dir.exists():
        shutil.rmtree(nvim_dir)
    shutil.move(str(extracted), str(nvim_dir))

    BIN_DIR.mkdir(parents=True, exist_ok=True)
    bin_link = BIN_DIR / "nvim"
    if bin_link.is_symlink() or bin_link.exists():
        bin_link.unlink()
    bin_link.symlink_to(nvim_dir / "bin" / "nvim")

    tar_path.unlink(missing_ok=True)
    success("neovim instalado")


def post_install():
    header("Plugins de Neovim")
    info("Sincronizando plugins (Lazy.nvim)...")
    subprocess.run(
        'nvim --headless "+Lazy! sync" +qa',
        shell=True,
        check=False,
    )
    success("Plugins de neovim sincronizados")
