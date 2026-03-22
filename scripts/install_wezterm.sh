#!/usr/bin/env bash

set -e

if command -v wezterm &>/dev/null; then
  echo "WezTerm already installed"
  exit 0
fi

echo "Installing WezTerm..."

curl -fsSL https://apt.fury.io/wez/gpg.key |
  sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg

echo "deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *" |
  sudo tee /etc/apt/sources.list.d/wezterm.list

sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg

sudo apt update
sudo apt install -y wezterm
