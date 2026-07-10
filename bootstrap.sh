#!/usr/bin/env bash
# The following makes the bash script fail fast (safer):
# -e Exit immediately if a command exits with a non-zero status.
# -u Treat unset variables as an error when substituting.
# -o pipefail Cause a pipeline to fail if any subcommand fails.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if command -v python3 &>/dev/null; then
    exec python3 "$SCRIPT_DIR/install_scripts/cli.py" "$@"
elif command -v python &>/dev/null; then
    exec python "$SCRIPT_DIR/install_scripts/cli.py" "$@"
else
    echo "[ERROR] Python no está instalado. Instálalo antes de continuar."
    exit 1
fi
