import os
import shutil
import subprocess
from pathlib import Path

from common import info, success, header


def install_rust():
    if shutil.which("rustc"):
        info("Rust ya instalado")
        return

    header("Rust")
    subprocess.run(
        "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y",
        shell=True,
        check=True,
    )
    cargo_bin = Path.home() / ".cargo" / "bin"
    if cargo_bin.exists():
        env = os.environ.copy()
        env["PATH"] = f"{cargo_bin}:{env.get('PATH', '')}"
    success("Rust installed!")


def install_fnm():
    if shutil.which("fnm"):
        info("fnm ya instalado")
        return

    header("fnm")
    subprocess.run(
        "curl -fsSL https://fnm.vercel.app/install | bash",
        shell=True,
        check=True,
    )
    fnm_dir = Path.home() / ".local" / "share" / "fnm"
    env = os.environ.copy()
    env["PATH"] = f"{fnm_dir}:{env.get('PATH', '')}"
    success("fnm installed! (install your Node.js version)")


def install_pnpm():
    if shutil.which("pnpm"):
        info("pnpm ya instalado")
        return

    header("pnpm")
    subprocess.run(
        "curl -fsSL https://get.pnpm.io/install.sh | sh -",
        shell=True,
        check=True,
    )
    success("pnpm instalado")


def install_uv():
    if shutil.which("uv"):
        info("uv ya instalado")
        return

    header("uv (Python)")
    subprocess.run(
        "curl -LsSf https://astral.sh/uv/install.sh | sh",
        shell=True,
        check=True,
    )
    success("uv instalado")


def install_all_runtimes():
    header("Runtimes")
    install_rust()
    install_fnm()
    install_pnpm()
    install_uv()
