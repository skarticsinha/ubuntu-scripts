#!/bin/bash

backup_dir=$(pwd)/gnome_extensions_backup

# Check if backup directory exists
if [ ! -d "$backup_dir" ]; then
    echo "Backup directory not found: $backup_dir"
    exit 1
fi

# Restore user-installed extensions
if [ -d "$backup_dir/user_extensions" ]; then
    for ext in "$backup_dir/user_extensions"/*; do
        ext_name=$(basename "$ext")
        cp -r "$ext" "$HOME/.local/share/gnome-shell/extensions/"
        if [ -f "$backup_dir/user_extensions/$ext_name.conf" ]; then
            dconf load /org/gnome/shell/extensions/"$ext_name"/ < "$backup_dir/user_extensions/$ext_name.conf"
        fi
    done
fi

# Restore system-wide extensions (requires sudo)
if [ -d "$backup_dir/system_extensions" ]; then
    for ext in "$backup_dir/system_extensions"/*; do
        ext_name=$(basename "$ext")
        sudo cp -r "$ext" /usr/share/gnome-shell/extensions/
        if [ -f "$backup_dir/system_extensions/$ext_name.conf" ]; then
            sudo dconf load /org/gnome/shell/extensions/"$ext_name"/ < "$backup_dir/system_extensions/$ext_name.conf"
        fi
    done
fi

# Restore the list of user-installed extensions
if [ -f "$backup_dir/user_extensions_list.txt" ]; then
    cat "$backup_dir/user_extensions_list.txt" | while read ext_name; do
        if [ -d "$backup_dir/user_extensions/$ext_name" ]; then
            cp -r "$backup_dir/user_extensions/$ext_name" "$HOME/.local/share/gnome-shell/extensions/"
        fi
    done
fi

# Restore the list of system-wide extensions
if [ -f "$backup_dir/system_extensions_list.txt" ]; then
    cat "$backup_dir/system_extensions_list.txt" | while read ext_name; do
        if [ -d "$backup_dir/system_extensions/$ext_name" ]; then
            sudo cp -r "$backup_dir/system_extensions/$ext_name" /usr/share/gnome-shell/extensions/
        fi
    done
fi

echo "Restore completed successfully!"
