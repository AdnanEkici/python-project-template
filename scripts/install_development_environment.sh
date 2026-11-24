#!/usr/bin/env bash
#
# install_development_environment.sh: create the local virtual environment for Nomad.
#
# What it does, in order:
#   1. Checks that python3 is installed and is version 3.11.
#   2. Creates a virtual environment in .venv (after asking first).
#   3. Upgrades pip and installs everything in requirements.txt
#      (which includes requirements-prod.txt and requirements-dev.txt).
#
# Requirements:
#   - python3 (3.11).
#   - Run it from the project root (where requirements.txt lives).
#
# Usage:
#   bash scripts/install_development_environment.sh
#
# Safe to run again: an existing venv is reused and installed packages are only updated.

set -Eeuo pipefail

# ================= Colors =================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# ================= Settings =================
VENV_PATH=".venv"
REQUIREMENTS_FILE="requirements.txt"
REQUIRED_PYTHON_MAJOR=3
REQUIRED_PYTHON_MINOR=11

# ================= Helpers =================
banner() {
    echo -e "${BOLD}${CYAN}==> $*${RESET}"
}

info() {
    echo -e "${BLUE}•${RESET} $*"
}

warn() {
    echo -e "${YELLOW}!${RESET} $*"
}

ok() {
    echo -e "${GREEN}✔${RESET} $*"
}

fail() {
    echo -e "${RED}✖ ${BOLD}$*${RESET}"
    exit 1
}

confirm_action() {
    while true; do
        read -r -p "$(echo -e "${PURPLE}Create a virtual environment in '$VENV_PATH'? (yes/no): ${RESET}")" choice

        case "${choice,,}" in
            y|yes)
                return 0
                ;;
            n|no)
                return 1
                ;;
            *)
                warn "Please answer 'yes' or 'no'."
                ;;
        esac
    done
}

check_python_version() {
    local python_major
    local python_minor
    local python_version

    python_major="$(python3 -c 'import sys; print(sys.version_info.major)')"
    python_minor="$(python3 -c 'import sys; print(sys.version_info.minor)')"
    python_version="$(python3 --version 2>&1)"

    if [[ "$python_major" -ne "$REQUIRED_PYTHON_MAJOR" ||
          "$python_minor" -ne "$REQUIRED_PYTHON_MINOR" ]]; then
        fail "Python ${REQUIRED_PYTHON_MAJOR}.${REQUIRED_PYTHON_MINOR} is required, but found ${python_version}."
    fi

    ok "Python version verified: ${python_version}"
}

# ================= Script =================
banner "Virtual Environment Setup"

if confirm_action; then
    command -v python3 >/dev/null 2>&1 || \
        fail "python3 is not installed."

    check_python_version

    [[ -f "$REQUIREMENTS_FILE" ]] || \
        fail "'$REQUIREMENTS_FILE' not found. Run this script from the project root."

    banner "Creating virtual environment at ${VENV_PATH}"
    python3 -m venv "$VENV_PATH" || \
        fail "Virtual environment creation failed."

    pip_bin="$VENV_PATH/bin/pip"

    banner "Upgrading pip"
    "$pip_bin" install --upgrade pip || \
        fail "pip upgrade failed."

    banner "Installing dependencies from ${REQUIREMENTS_FILE}"
    "$pip_bin" install -r "$REQUIREMENTS_FILE" || \
        fail "Requirements installation failed."

    ok "Virtual environment setup complete."

    info "Activate it with:"
    info "   source $VENV_PATH/bin/activate"
else
    echo -e "${BLUE}Aborted. No action taken.${RESET}"
fi
