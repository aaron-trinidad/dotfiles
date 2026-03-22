#!/usr/bin/env bash

set -e

FONT_DIR="$HOME/.local/share/fonts"

mkdir -p "$FONT_DIR"
cd "$FONT_DIR"

if [ -d "IosevkaTerm" ]; then
  echo "Font already installed"
  exit 0
fi

echo "Installing Iosevka Nerd Font..."

curl -fLo "iosevka.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.zip

unzip iosevka.zip -d IosevkaTerm
rm iosevka.zip

fc-cache -fv
