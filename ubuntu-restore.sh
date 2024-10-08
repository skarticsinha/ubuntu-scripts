#!/bin/bash

HOME_DIR=$(pwd)

if [ -x "$HOME_DIR"/essentials.sh ]; then
    "$HOME_DIR"/essentials.sh
else
    echo "Skipping $HOME_DIR/essentials.sh, not executable."
fi

for script in "$HOME_DIR"/packages/*.sh; do
    if [ -x "$script" ]; then
        "$script"
    else
        echo "Skipping $script, not executable."
    fi
done

if [ -x "$HOME_DIR"/config/shell-restore.sh ]; then
    "$HOME_DIR"/config/shell-restore.sh
else
    echo "Skipping $HOME_DIR/config/shell-restore.sh, not executable."
fi

if [ -x "$HOME_DIR"/config/extension-restore.sh ]; then
    "$HOME_DIR"/config/extension-restore.sh
else
    echo "Skipping $HOME_DIR/config/extension-restore.sh, not executable."
fi
