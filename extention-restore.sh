#!/bin/bash

backup_dir=$(pwd)/gnome_extensions_backup

# Check if backup directory exists
if [ ! -d "$backup_dir" ]; then
    echo "Backup directory not found: $backup_dir"
    exit 1
fi

# Restore user-installed extensions
if [ -d "$backup_dir/user_extensions" ]; then
    cp -r "$backup_dir/user_extensions"/* "$HOME/.local/share/gnome-shell/extensions/"
fi

# Restore system-wide extensions (requires sudo)
if [ -d "$backup_dir/system_extensions" ]; then
    sudo cp -r "$backup_dir/system_extensions"/* /usr/share/gnome-shell/extensions/
fi

# Restore dconf settings
if [ -f "$backup_dir/gnome_extensions_settings.conf" ]; then
    dconf load /org/gnome/shell/extensions/ < "$backup_dir/gnome_extensions_settings.conf"
fi

echo "Restore completed successfully!"
