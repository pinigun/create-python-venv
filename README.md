# CPV - Create Python Venv
> A simple bash script for creating and activating a Python virtual environment

# Instalation
Cloning this repository, and after:

### Linux, MacOS
```bash
cd create-python-venv
chmod +x install-linux.sh
./install-linux.sh
# You see it:
# >>>Finish!
# >>>To apply changes restart the terminal or use commands:
# >>>if you use bash:  source ~/.bashrc
# >>>if you use zsh:   source ~/.zshrc
# 
# >>>After you can use 'cpv --help' for check more information.

source ~/.bashrc  # If you use bash
source ~/.zshrc   # If you use zsh

cpv --help
```

### Windows
Now is not supported


# Basic Usage
### Creating simple .venv

_This_
```bash
python3 -m venv .venv
source .venv/bin/activate
```
_Equal_
```bash
cpv
```

### If you need change directory name you can use -n or --venv-name
_This_
```bash
python3 -m venv env
source env/bin/activate
```
_Equal_
```bash
cpv -n env
```

### About more
```
cpv --help
```