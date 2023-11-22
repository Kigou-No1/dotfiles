<div align="center">
[![test for initializer of dotfiles for macOS](https://github.com/Kigou-No1/dotfiles/actions/workflows/init-mac.yml/badge.svg)](https://github.com/Kigou-No1/dotfiles/actions/workflows/init-mac.yml)
[![test for initializer of dotfiles for Linux](https://github.com/Kigou-No1/dotfiles/actions/workflows/init-linux.yml/badge.svg)](https://github.com/Kigou-No1/dotfiles/actions/workflows/init-linux.yml)


# dotfiles

environment for [Kigou_](https://github.com/Kigou-No1)

</div>

# Usage
##  Install
Standard installation
```
make install
```
## Interactive Install
It's mostly same as Install but the script interactively asks for settings.
```
make Iinstall
```
## Only deploy
The script will create symbolic links and rename file to `~~.bak` if already exists files
```
make deploy
```
## Only install CLI Tools
The script will install CLI Tools that I commonly use.
```
make app
```
## Only install CLI & GUI Tools
The script will install CLI Tools & GUI Tools that I commonly use.
```
make app-extra
```
## Interactive setup of git
The script will set-up git interactively
```
make setup-git
```
<br>
