set -xeu
echo "Setup your environment..."
DOTFILES=$(cd $(dirname $0) && pwd)
ls
# Install homebrew
./bin/brew.sh

# Install zsh
shell_name=`basename "$(readlink "/proc/$$/exe")"`
if [ ${shell_name} != ""]; then
    echo "Installing zsh..."
    brew install zsh
    sudo chsh -s $(which zsh)
fi

# Create symlinks
echo "Creating symlinks..."
./bin/symlink.sh

if [ "$(uname)" = 'Darwin' ]; then
    echo "configuring mac..."
    ./macos/defaults.sh
elif [ "$(uname)" = "Linux" ]; then
    echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> zsh/linux.zsh
else

echo "Done."
