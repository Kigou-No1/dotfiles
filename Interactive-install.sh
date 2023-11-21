set -xeu
echo "Setup your environment..."
DOTFILES=$(cd $(dirname $0) && pwd)

if [!"$(uname)" == 'Darwin' ]; then
    echo "Please use install.sh for Linux."
    exit 0
fi

# Install fonts
echo "Installing fonts..."
cp ./fonts/* ~/Library/Fonts/

# Install homebrew and softwares
./bin/brew.sh

# Install zsh
shell_name=`basename "$(readlink "/proc/$$/exe")"`
if [${shell_name} != ""]; then
    echo "Installing zsh..."
    brew install zsh
    chsh -s $(which zsh)
fi

# Setup Git
echo "Setting up Git..."
./bin/setup-git.sh

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
echo "Please import your BTT settings manually."
echo "Please import your iTerm2 settings manually."
