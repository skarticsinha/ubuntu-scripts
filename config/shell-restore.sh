#!/bin/bash

source_folder=$(pwd)

# Define the target locations
target_zshrc="$HOME/.zshrc"
target_oh_my_zsh="$HOME/.oh-my-zsh"
target_terminator="$HOME/.config/terminator"

# Copy the files and directories to their original locations
cp $source_folder/zshrc $target_zshrc
cp -r $source_folder/oh-my-zsh $target_oh_my_zsh
cp -r $source_folder/terminator $target_terminator
