#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"

echo "Installing dotfiles..."

# -------------------------
# Install packages
# -------------------------

echo "Installing packages..."

sudo apt update

xargs -a "$DOTFILES/packages.txt" sudo apt install -y

# -------------------------
# Create symlinks
# -------------------------

echo "Creating symlinks..."

ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES/.wezterm.lua" "$HOME/.wezterm.lua"

# -------------------------
# Install TPM (tmux plugin manager)
# -------------------------

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# -------------------------
# Done
# -------------------------

echo "Dotfiles installed!"
echo "Restart terminal and run tmux, then press Prefix + I to install plugins."
