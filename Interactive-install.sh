set -xeu
echo "Setup your environment..."
$DOTFILES = $(cd $(dirname $0) && pwd)

if [!"$(uname)" == 'Darwin' ]; then
    echo "Please use install.sh for Linux."
    exit 0
fi

# Add permissions
chmod +x ./$DOTFILES/bin/*.sh

# Install fonts
echo "Installing fonts..."
cp ./fonts/* ~/Library/Fonts/

# Install homebrew and softwares
./$DOTFILES/bin/brew.sh

# Install zsh
shell_name = `basename "$(readlink "/proc/$$/exe")"`
if [${shell_name} != ""] then;
    echo "Installing zsh..."
    brew install zsh
    chsh -s $(which zsh)
fi

# Setup Git
echo "Setting up Git..."
./$DOTFILES/bin/setup-git.sh

echo "Installing other softwares..."
./$DOTFILES/bin/misc-softwares.sh

# Create symlinks
echo "Creating symlinks..."
./$DOTFILES/bin/symlink.sh

if ["$(uname)" == 'Darwin' ]; then
    echo "configuring mac..."
    ./$DOTFILES/macos/defaults.sh
fi


echo "Done."
echo "Please import your BTT settings manually."
echo "Please import your iTerm2 settings manually."
