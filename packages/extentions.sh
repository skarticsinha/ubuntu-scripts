#!/bin/bash

# Update package list
sudo apt update

# Install GNOME Tweaks
sudo apt install -y gnome-tweaks

# Install GNOME Shell Extensions
sudo apt install -y gnome-shell-extensions

# Install GNOME Shell Integration for web browsers
sudo apt install -y chrome-gnome-shell

echo "Installation complete. You may need to restart your session for changes to take effect."

# Install GNOME Shell Extensions from extensions.gnome.org
gnome-extensions install blur-my-shell@aunetx
gnome-extensions install clipboard-indicator@tudmotu.com
gnome-extensions install dash-to-dock@micxgx.gmail.com
gnome-extensions install hidetopbar@mathieu.bidon.ca
gnome-extensions install vitals@corecoding.com
gnome-extensions install wallpaper-slideshow@random.com

echo "GNOME Shell Extensions installed. You may need to restart your session for changes to take effect."