#!/bin/bash

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

