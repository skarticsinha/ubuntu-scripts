#!/bin/bash

# Update package list
sudo apt update

# Install build-essential
sudo apt install -y build-essential
echo "Installation of build-essential is complete."

# Install curl
sudo apt install -y curl
echo "Installation of curl is complete."

# Install file
sudo apt install -y file
echo "Installation of file is complete."

# Install git
sudo apt install -y git
echo "Installation of git is complete."

# Install wget
sudo apt install -y wget
echo "Installation of wget is complete."