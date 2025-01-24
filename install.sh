#!/bin/bash

# Dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# Create symlinks
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

echo "Symlinks created successfully!"
