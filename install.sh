#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"

echo "================================="
echo " Installing Aaron's dotfiles"
echo "================================="

# Base packages

if [ -f "$DOTFILES/packages.txt" ]; then
  echo "Installing base packages..."
  sudo apt update
  xargs -a "$DOTFILES/packages.txt" sudo apt install -y
fi

# Oh My Zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Extra tools

bash "$DOTFILES/scripts/install/install_wezterm.sh"
bash "$DOTFILES/scripts/install/install_fonts.sh"
bash "$DOTFILES/scripts/install/install_tools.sh"
bash "$DOTFILES/scripts/install/install_neovim.sh"

# Symlinks

link_file() {
  SRC=$1
  DEST=$2

  if [ -L "$DEST" ]; then
    echo "Symlink exists: $DEST"
  elif [ -e "$DEST" ]; then
    echo "Backing up: $DEST"
    mv "$DEST" "$DEST.backup"
    ln -s "$SRC" "$DEST"
  else
    ln -s "$SRC" "$DEST"
    echo "Linked: $DEST"
  fi
}

echo "Creating symlinks..."

mkdir -p "$HOME/.config"

# Home files

link_file "$DOTFILES/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES/.wezterm.lua" "$HOME/.wezterm.lua"
link_file "$DOTFILES/.p10k.zsh" "$HOME/.p10k.zsh"
link_file "$DOTFILES/.config/i3/config" "$HOME/.config/i3/config"
link_file "$DOTFILES/.config/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES/.config/polybar/config.ini" "$HOME/.config/polybar/config.ini"
link_file "$DOTFILES/.config/rofi/config.rasi" "$HOME/.config/rofi/config.rasi"

# Scripts

link_file "$DOTFILES/scripts/system" "$HOME/.config/scripts"

# TPM (tmux plugin manager)

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Installing tmux plugins..."

tmux start-server || true
tmux source-file ~/.tmux.conf || true
~/.tmux/plugins/tpm/bin/install_plugins || true

# Final message

echo "================================="
echo " Done. Restart terminal (zsh)."
echo "================================="
