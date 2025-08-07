#!/bin/bash

# Default values
DEFAULT_VENV_NAME=".venv"
FORCE_RECREATE=false
ALIAS_NAME="cpv"


show_help() {
    echo $ALIAS_NAME
    cat << EOF
Usage: $ALIAS_NAME [OPTIONS]

Manage Python virtual environments.

Options:
  -n, --venv-name NAME    Set the name for the virtual environment 
                          (default: $DEFAULT_VENV_NAME)
  -f, --force             Force recreation of the virtual environment 
                          if it already exists
  -rm, --remove NAME      Remove the specified virtual environment and exit
  -h, --help              Show this help message and exit

Examples:
  $ALIAS_NAME -n myenv       Create virtual environment named 'myenv'
  $ALIAS_NAME --force        Force recreate the default virtual environment
  $ALIAS_NAME --remove oldenv Remove virtual environment named 'oldenv'
EOF
}


# Checking arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --help|-h)
            show_help;
            exit 0;
        ;;
        --venv-name|-n) 
            DEFAULT_VENV_NAME="$2";
            shift
        ;;
        --force|-f)
            FORCE_RECREATE=true
        ;;
        --remove|-rm)
            rm -rf $2;
            exit 0;
        ;;
        *)
            echo "[ERROR] Unknown option '$1'";
            echo "Use --help for usage information";
            exit 1;
        ;;
    esac
    shift
done

# Checking existing directiory and flag "-f|--force"
if [[ $FORCE_RECREATE = false && -d $DEFAULT_VENV_NAME ]]; then
    echo "[WARNING] Directory ${DEFAULT_VENV_NAME} already exist.";
    read -p "Recreating the environmnet will delete all existing packages. Confirm? [yes/no]: " confirm
    case $confirm in
        y|Y|YES|Yes|yes) ;;
        *) exit 1;;
    esac
fi

# Creating python environment
python3 -m venv $DEFAULT_VENV_NAME --clear

