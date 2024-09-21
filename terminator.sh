#!/bin/bash

# Update package lists
sudo apt update

# Install Terminator
sudo apt install -y terminator

# Confirm installation
if command -v terminator &> /dev/null
then
    echo "Terminator has been installed successfully."
else
    echo "Failed to install Terminator."
fi