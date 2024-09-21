#!/bin/bash

# Update package list
sudo apt update

# Install zsh
sudo apt install -y zsh

# Verify installation
if command -v zsh >/dev/null 2>&1; then
    echo "zsh installed successfully"
else
    echo "zsh installation failed"
fi