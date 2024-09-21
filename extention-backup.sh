#!/bin/bash

source_folder=$(pwd)

# Set backup directory
backup_dir="$source_folder/gnome_extensions_backup"

# Create the backup directory
mkdir -p "$backup_dir"

# Backup user-installed extensions
if [ -d "$HOME/.local/share/gnome-shell/extensions" ]; then
    cp -r "$HOME/.local/share/gnome-shell/extensions" "$backup_dir/user_extensions"
fi

# Backup system-wide extensions
if [ -d "/usr/share/gnome-shell/extensions" ]; then
    sudo cp -r /usr/share/gnome-shell/extensions "$backup_dir/system_extensions"
fi

# Backup dconf settings
dconf dump /org/gnome/shell/extensions/ > "$backup_dir/gnome_extensions_settings.conf"

echo "Backup completed successfully!"
echo "Backup directory: $backup_dir"
