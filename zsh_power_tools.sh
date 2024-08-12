#!/usr/bin/env zsh

# Fixes a corrupt .zsh_history file and restores the user's path
function zsh_history_fix() {
    # Save the current path
    local currentPath=$PWD
    
    # Change to the home directory
    cd ~

    # Move the corrupt .zsh_history to a backup file
    mv ~/.zsh_history ~/.zsh_history_bad

    # Process the backup file and create a new .zsh_history
    strings ~/.zsh_history_bad > ~/.zsh_history

    # Reload the new .zsh_history into the current shell session
    fc -R ~/.zsh_history

    # Remove the backup file
    rm ~/.zsh_history_bad
    
    # Restore the original path
    cd "$currentPath"
}

# Function to create a directory and move into it
mcd() {
    # Check if a folder name was provided
    if [ -z "$1" ]; then
        echo "Error: No folder name provided."
        return 1
    fi
    
    local folder_name="$1"
    
    # Create the directory
    mkdir -p "$folder_name"
    
    # Check if the directory was created successfully
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory $folder_name."
        return 1
    fi
    
    # Move into the directory
    cd "$folder_name" || return 1
}


