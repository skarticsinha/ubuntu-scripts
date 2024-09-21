#!/bin/bash

# Check if zsh is installed
if ! command -v zsh &> /dev/null
then
    echo "zsh is not installed. Please install zsh first."
    exit 1
fi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"