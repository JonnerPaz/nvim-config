import json
import re
import shutil
import subprocess
import tarfile
import tempfile
import urllib.request
from pathlib import Path

from common import detect_distro, info, success, warn, header, BIN_DIR


def github_release(repo, pattern):
    url = f"https://api.github.com/repos/{repo}/releases/latest"
    req = urllib.request.Request(url, headers={"User-Agent": "dotfiles-setup"})
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            data = json.loads(resp.read())
    except Exception as e:
        warn(f"Error consultando GitHub API para {repo}: {e}")
        return None

    for asset in data.get("assets", []):
        download_url = asset.get("browser_download_url", "")
        if re.search(pattern, download_url):
            return download_url
    return None


def install_tool(name, repo, pattern, binary):
    if shutil.which(binary):
        info(f"{name} ya instalado")
        return

    header(name)

    url = github_release(repo, pattern)
    if not url:
        warn(f"No se pudo obtener URL de {name}")
        return

    with tempfile.TemporaryDirectory() as tmp:
        tmp_path = Path(tmp)
        tar_path = tmp_path / "pkg.tar.gz"

        try:
            urllib.request.urlretrieve(url, tar_path)
        except Exception as e:
            warn(f"Error descargando {name}: {e}")
            return

        try:
            with tarfile.open(tar_path, "r:gz") as tar:
                tar.extractall(tmp_path)
        except Exception as e:
            warn(f"Error extrayendo {name}: {e}")
            return

        bin_found = None
        for f in tmp_path.rglob(binary):
            if f.is_file():
                bin_found = f
                break

        if not bin_found:
            warn(f"No se encontró {binary} en el archivo extraído")
            return

        BIN_DIR.mkdir(parents=True, exist_ok=True)
        shutil.copy2(bin_found, BIN_DIR / binary)
        (BIN_DIR / binary).chmod(0o755)
        success(f"{name} instalado")


def install_ripgrep():
    install_tool("ripgrep", "BurntSushi/ripgrep", r"musl.*x86_64", "rg")


def install_fd():
    install_tool("fd", "sharkdp/fd", r"musl.*x86_64", "fd")


def install_bat():
    install_tool("bat", "sharkdp/bat", r"musl.*x86_64", "bat")


def install_delta():
    install_tool("delta", "dandavison/delta", r"musl.*x86_64", "delta")


def install_lazygit():
    install_tool("lazygit", "jesseduffield/lazygit", r"Linux_x86_64", "lazygit")


def install_zoxide():
    if shutil.which("zoxide"):
        info("zoxide ya instalado")
        return

    header("zoxide")
    subprocess.run(
        "curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash",
        shell=True,
        check=True,
    )
    success(
        "zoxide instalado. Es necesario cerrar y volver a abrir la terminal"
    )


def install_all_tools():
    header("Herramientas CLI")

    if detect_distro().get("pm") == "dnf":
        subprocess.run(
            "sudo dnf install -y ripgrep fd bat delta",
            shell=True,
            check=True,
        )
        success("Herramientas CLI instaladas")
    else:
        install_ripgrep()
        install_fd()
        install_bat()
        install_delta()
        install_lazygit()

    install_zoxide()
