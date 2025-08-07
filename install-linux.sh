#!/bin/bash
GENERAL_FILE_NAME="create-python-venv.sh"
ALIAS_NAME="cpv"

if [[ ! -f $GENERAL_FILE_NAME ]]; then
    echo "[ERROR] File "$GENERAL_FILE_NAME" doesn't exist in this directory."
    exit 1;
fi

if [[ -d "/usr/local/bin" ]]; then
    TARGET_DIR="/usr/local/bin"
elif [ -d "/usr/bin" ]; then
    TARGET_DIR="/usr/bin"
else
    TARGET_DIR="$HOME/bin"
    mkdir -p "$TARGET_DIR"
    export PATH="$PATH:$TARGET_DIR"
fi

sudo cp $GENERAL_FILE_NAME $TARGET_DIR
sudo chmod +x "$TARGET_DIR/$GENERAL_FILE_NAME"


if [[ -f "$HOME/.bashrc" ]]; then
    if ! grep -q "alias $ALIAS_NAME='source $GENERAL_FILE_NAME'" ~/.bashrc; then
        sudo echo "alias $ALIAS_NAME='source $GENERAL_FILE_NAME'" >> ~/.bashrc;
    fi
fi
if [[ -f "$HOME/.zshrc" ]]; then
    if ! grep -q "alias $ALIAS_NAME='source $GENERAL_FILE_NAME'" ~/.zshrc; then
        sudo echo "alias $ALIAS_NAME='source $GENERAL_FILE_NAME'" >> ~/.zshrc;
    fi
fi

echo "Finish!"
echo "To apply changes restart the terminal or use commands:"
echo "if you use bash:  source ~/.bashrc"
echo "if you use zsh:   source ~/.zshrc"
echo
echo "After you can use 'cpv --help' for check more information."