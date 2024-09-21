#!/bin/bash

# Function to install Google Chrome
install_chrome() {
    echo "Installing Google Chrome..."
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt -f install -y
    rm google-chrome-stable_current_amd64.deb
    echo "Google Chrome installed successfully!"
}

# Function to install Firefox
install_firefox() {
    echo "Installing Firefox..."
    sudo apt install -y firefox
    echo "Firefox installed successfully!"
}

# Function to install Brave Browser
install_brave() {
    echo "Installing Brave Browser..."
    sudo apt install -y apt-transport-https curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install -y brave-browser
    echo "Brave Browser installed successfully!"
}

# Function to install Microsoft Edge
install_edge() {
    echo "Installing Microsoft Edge..."
    wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_95.0.1020.40-1_amd64.deb
    sudo dpkg -i microsoft-edge-stable_95.0.1020.40-1_amd64.deb
    sudo apt -f install -y
    rm microsoft-edge-stable_95.0.1020.40-1_amd64.deb
    echo "Microsoft Edge installed successfully!"
}

# Update package list
sudo apt update

# Initialize boolean list
install_chrome_flag=false
install_firefox_flag=false
install_brave_flag=false
install_edge_flag=false

# Prompt user for each browser
read -p "Install Google Chrome? (y/n): " chrome_choice
read -p "Install Firefox? (y/n): " firefox_choice
read -p "Install Brave Browser? (y/n): " brave_choice
read -p "Install Microsoft Edge? (y/n): " edge_choice

# Update boolean list based on user input
if [[ $chrome_choice == "y" || $chrome_choice == "Y" ]]; then
    install_chrome_flag=true
fi

if [[ $firefox_choice == "y" || $firefox_choice == "Y" ]]; then
    install_firefox_flag=true
fi

if [[ $brave_choice == "y" || $brave_choice == "Y" ]]; then
    install_brave_flag=true
fi

if [[ $edge_choice == "y" || $edge_choice == "Y" ]]; then
    install_edge_flag=true
fi

# Install selected browsers
if $install_chrome_flag; then
    install_chrome
fi

if $install_firefox_flag; then
    install_firefox
fi

if $install_brave_flag; then
    install_brave
fi

if $install_edge_flag; then
    install_edge
fi

echo "Browsers installed successfully!"
