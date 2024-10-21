#!/bin/bash

source_folder=$(pwd)

# # Set backup directory
# backup_dir="$source_folder/gnome_extensions_backup"

# # Create the backup directory
# mkdir -p "$backup_dir"

# # Backup user-installed extensions
# if [ -d "$HOME/.local/share/gnome-shell/extensions" ]; then
#     cp -r "$HOME/.local/share/gnome-shell/extensions" "$backup_dir/user_extensions"
# fi

# # Backup system-wide extensions
# if [ -d "/usr/share/gnome-shell/extensions" ]; then
#     sudo cp -r /usr/share/gnome-shell/extensions "$backup_dir/system_extensions"
# fi

# # Backup dconf settings
# dconf dump /org/gnome/shell/extensions/ > "$backup_dir/gnome_extensions_settings.conf"

# echo "Backup completed successfully!"
# echo "Backup directory: $backup_dir"

# Backup configuration files for each user-installed extension
if [ -d "$HOME/.local/share/gnome-shell/extensions" ]; then
    for extension in "$HOME/.local/share/gnome-shell/extensions"/*; do
        extension_name=$(basename "$extension")
        dconf dump /org/gnome/shell/extensions/"$extension_name"/ > "$backup_dir/user_extensions/$extension_name.conf"
    done
fi

# Backup configuration files for each system-wide extension
if [ -d "/usr/share/gnome-shell/extensions" ]; then
    for extension in /usr/share/gnome-shell/extensions/*; do
        extension_name=$(basename "$extension")
        dconf dump /org/gnome/shell/extensions/"$extension_name"/ > "$backup_dir/system_extensions/$extension_name.conf"
    done
fi
# Save the list of user-installed extensions
if [ -d "$HOME/.local/share/gnome-shell/extensions" ]; then
    ls "$HOME/.local/share/gnome-shell/extensions" > "$backup_dir/user_extensions_list.txt"
fi

# Save the list of system-wide extensions
if [ -d "/usr/share/gnome-shell/extensions" ]; then
    ls /usr/share/gnome-shell/extensions > "$backup_dir/system_extensions_list.txt"
fi