#!/bin/bash

# Define the source locations
source_zshrc="$HOME/.zshrc"
source_oh_my_zsh="$HOME/.oh-my-zsh"
source_terminator="$HOME/.config/terminator"

# Set backup directory
backup_dir="$(pwd)/shell_backup"

# Create the backup directory
mkdir -p "$backup_dir"

# Backup .zshrc
if [ -f "$source_zshrc" ]; then
    cp "$source_zshrc" "$backup_dir/zshrc"
fi

# Backup Oh My Zsh
if [ -d "$source_oh_my_zsh" ]; then
    cp -r "$source_oh_my_zsh" "$backup_dir/oh-my-zsh"
fi

# Backup Terminator config
if [ -d "$source_terminator" ]; then
    cp -r "$source_terminator" "$backup_dir/terminator"
fi

echo "Backup completed successfully!"
echo "Backup directory: $backup_dir"
