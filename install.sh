set -xeu
echo "Setup your environment..."
DOTFILES=$(cd $(dirname $0) && pwd)
ls
# Install homebrew
./bin/brew.sh

# Install zsh
shell_name=`basename "$(readlink "/proc/$$/exe")"`
if [${shell_name} != ""] then;
    echo "Installing zsh..."
    brew install zsh
    chsh -s $(which zsh)
fi

echo "Installing other softwares..."
./bin/misc-softwares.sh

# Create symlinks
echo "Creating symlinks..."
./bin/symlink.sh

if ["$(uname)" == 'Darwin' ]; then
    echo "configuring mac..."
    ./macos/defaults.sh
fi

echo "Done."
