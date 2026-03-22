#!/usr/bin/env bash

set -e

# Zoxide
if ! command -v zoxide &>/dev/null; then
  echo "Installing zoxide..."
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

# Atuin
if ! command -v atuin &>/dev/null; then
  echo "Installing atuin..."
  curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash
fi
