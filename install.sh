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

# Run extra installers

bash "$DOTFILES/scripts/install_wezterm.sh"
bash "$DOTFILES/scripts/install_fonts.sh"
bash "$DOTFILES/scripts/install_tools.sh"

# Symlinks

link_file() {
  SRC=$1
  DEST=$2

  if [ -L "$DEST" ]; then
    echo "Symlink exists: $DEST"
  elif [ -f "$DEST" ]; then
    echo "Backing up: $DEST"
    mv "$DEST" "$DEST.backup"
    ln -s "$SRC" "$DEST"
  else
    ln -s "$SRC" "$DEST"
    echo "Linked: $DEST"
  fi
}

echo "Creating symlinks..."

link_file "$DOTFILES/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES/.wezterm.lua" "$HOME/.wezterm.lua"

# Oh My Zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# TPM

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# LazyVim

if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
fi

echo "================================="
echo " Done. Open Wezterm or Restart it."
echo "================================="
