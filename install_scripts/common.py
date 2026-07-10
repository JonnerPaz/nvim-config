import sys
from pathlib import Path

RED = "\033[0;31m"
GREEN = "\033[0;32m"
YELLOW = "\033[1;33m"
BLUE = "\033[0;34m"
CYAN = "\033[0;36m"
NC = "\033[0m"


def info(*args):
    print(f"{BLUE}[INFO]{NC}  {' '.join(str(a) for a in args)}")


def success(*args):
    print(f"{GREEN}[OK]{NC}    {' '.join(str(a) for a in args)}")


def warn(*args):
    print(f"{YELLOW}[WARN]{NC}  {' '.join(str(a) for a in args)}")


def error(*args):
    print(f"{RED}[ERROR]{NC} {' '.join(str(a) for a in args)}")
    sys.exit(1)


def header(text):
    print(f"\n{CYAN}═══ {text} ═══{NC}")


SCRIPT_DIR = Path(__file__).resolve().parent
DOTFILES_DIR = SCRIPT_DIR.parent / "dotfiles"
BIN_DIR = Path.home() / ".local" / "bin"


def detect_distro():
    """Detect distro the system is running and return its package manager"""

    os_release_path = Path("/etc/os-release")
    if not os_release_path.exists():
        error("No se pudo detectar la distro (/etc/os-release no existe)")

    distro_info: dict[str, str] = {}
    with open(os_release_path) as file:
        for line in file:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            if "=" in line:
                key, value = line.split("=", 1)
                distro_info[key] = value.strip("\"'")

    distro_id = distro_info.get("ID", "")

    # distros I use
    mapping = {
        "ubuntu": "apt",
        "fedora": "dnf",
    }

    pm = mapping.get(distro_id)
    if not pm:
        error(f"Distro no soportada: {distro_id}. Soporte: Ubuntu/Fedora")

    distro_info["pm"] = "dnf" if pm == "dnf" else "apt"
    return distro_info


def confirm(prompt="Continue?"):
    prompt_str = f"{prompt} [y/N]: "

    while True:
        answer = input(prompt_str).strip().lower()
        if answer in ("y", "yes", "n", "no"):
            break

    # True if answer is "y" or "yes"
    return answer.startswith("y")
