#!/bin/bash

# Install basic packages
sudo pacman -S --needed git-lfs neovim starship fish

# Install uv
if ! command -v uv &> /dev/null; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi
