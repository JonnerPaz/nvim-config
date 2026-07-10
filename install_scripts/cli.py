#!/usr/bin/env python3
import argparse
import sys
import os

from common import (
    BLUE,
    GREEN,
    YELLOW,
    NC,
    info,
    error,
    BIN_DIR,
    detect_distro,
    confirm,
)
from packages import install_system_packages
from tools import (
    install_ripgrep,
    install_fd,
    install_bat,
    install_delta,
    install_lazygit,
    install_zoxide,
    install_all_tools,
)
from runtimes import (
    install_rust,
    install_fnm,
    install_pnpm,
    install_uv,
    install_all_runtimes,
)
from shell import install_ohmyzsh, install_shell
from neovim import install_neovim
from dotfiles import install_dotfiles


def print_banner():
    print()
    print(f"{BLUE}╔═══════════════════════════════════════╗{NC}")
    print(f"{BLUE}║             Bootstrap                 ║{NC}")
    print(f"{BLUE}╚═══════════════════════════════════════╝{NC}")
    print()


def show_summary():
    print()
    print(f"{GREEN}╔═══════════════════════════════════════╗{NC}")
    print(f"{GREEN}║      Instalation complete!            ║{NC}")
    print(f"{GREEN}╚═══════════════════════════════════════╝{NC}")
    print(f"  Cierra y abre una nueva terminal o ejecuta: {YELLOW}exec zsh{NC}")
    print()


def run_full():
    distro = detect_distro()

    info(f"Distro: {distro.get('NAME', distro.get('ID', 'desconocida'))}")

    install_system_packages(distro.get("pm"))
    install_neovim()
    install_all_tools()
    install_all_runtimes()
    install_shell()
    install_dotfiles()


def interactive_mode():
    if confirm("Install Dotfiles?"):
        run_full()
    else:
        print("Instalation cancelled")
        sys.exit(0)


TOOL_MAP = {
    "ripgrep": install_ripgrep,
    "rg": install_ripgrep,
    "fd": install_fd,
    "bat": install_bat,
    "delta": install_delta,
    "lazygit": install_lazygit,
    "zoxide": install_zoxide,
    "neovim": install_neovim,
    "nvim": install_neovim,
    "rust": install_rust,
    "fnm": install_fnm,
    "pnpm": install_pnpm,
    "uv": install_uv,
    "ohmyzsh": install_ohmyzsh,
}

DESIRE_TOOLS = "ripgrep, fd, bat, delta, lazygit, zoxide, neovim, rust, fnm, pnpm, uv, ohmyzsh"


def main():
    BIN_DIR.mkdir(parents=True, exist_ok=True)

    os.environ["PATH"] = f"{BIN_DIR}:{os.environ.get('PATH', '')}"

    parser = argparse.ArgumentParser(
        description="Bootstrap - Install dotfiles and tools"
    )

    parser.add_argument(
        "mode",
        nargs="?",
        choices=["full"],
        help="Modo de instalación",
    )
    parser.add_argument(
        "--tool",
        metavar="NAME",
        help=f"Instalar una herramienta específica. Disponibles: {DESIRE_TOOLS}",
    )

    args = parser.parse_args()

    print_banner()

    if args.tool:
        installer = TOOL_MAP.get(args.tool)
        if installer:
            installer()
        else:
            error(f"Unknown tool: {args.tool}. Available: {DESIRE_TOOLS}")
        return

    if args.mode == "full":
        run_full()
    else:
        interactive_mode()

    show_summary()


if __name__ == "__main__":
    main()
