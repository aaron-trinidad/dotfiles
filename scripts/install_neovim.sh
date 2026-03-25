#!/usr/bin/env bash

set -e

if command -v nvim &> /dev/null; then
  echo "Neovim already installed"
  exit 0
fi

echo "Installing Neovim (latest)..."

cd /tmp

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
