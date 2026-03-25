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

# Carapace (APT Fury repo)
if ! command -v carapace &> /dev/null; then
  echo "Installing carapace..."

  if [ ! -f /etc/apt/sources.list.d/fury.list ]; then
    echo "deb [trusted=yes] https://apt.fury.io/rsteube/ /" | \
      sudo tee /etc/apt/sources.list.d/fury.list > /dev/null
  fi

  sudo apt update
  sudo apt install -y carapace-bin

fi

#Powerlevel10k
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  echo "Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Zsh plugins
mkdir -p "$HOME/.zsh"

if [ ! -d "$HOME/.zsh/zsh-autocomplete" ]; then
  git clone https://github.com/marlonrichert/zsh-autocomplete ~/.zsh/zsh-autocomplete
fi

if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

if [ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
fi
