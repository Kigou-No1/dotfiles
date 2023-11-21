set -xeu
echo "Setup your environment..."
DOTFILES=$(cd $(dirname $0) && pwd)
ls
# Install homebrew
./$DOTFILES/bin/brew.sh

# Install zsh
shell_name = `basename "$(readlink "/proc/$$/exe")"`
if [${shell_name} != ""] then;
    echo "Installing zsh..."
    brew install zsh
    chsh -s $(which zsh)
fi

echo "Installing other softwares..."
.$DOTFILES/bin/misc-softwares.sh

# Create symlinks
echo "Creating symlinks..."
.$DOTFILES/bin/symlink.sh

if ["$(uname)" == 'Darwin' ]; then
    echo "configuring mac..."
    chmod +x $DOTFILES/macos/defaults.sh
    .$DOTFILES/macos/defaults.sh
fi

echo "Done."
