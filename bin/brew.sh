set -xeu
DOTFILES=$(cd $(dirname $0) && pwd)

# Install Homebrew
echo "Installing Homebrew..."
if [ `uname` = 'Darwin' ]; then
    if [ ! $(command -v brew) = '']; then
        echo "Homebrew is already installed."
    else
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
elif [ `uname` = 'Linux' ]; then
    if type "brew" > /dev/null 2>&1; then
        echo "Linuxbrew is already installed."
    elif [ -d "$HOME/linuxbrew/.linuxbrew" ] ; then
        echo "Linuxbrew is already installed, but not set PATH."
        eval $($HOME/.linuxbrew/bin/brew shellenv)
    elif [ -d "/home/linuxbrew/.linuxbrew" ] ; then
        echo "Linuxbrew is already installed, but not set PATH."
        eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    else
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        test -d $HOME/.linuxbrew && eval $($HOME/.linuxbrew/bin/brew shellenv)
        test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    fi
else
    echo "We don't support your OS"
    exit 1
fi

# Install softwares
echo "Installing softwares..."
if [ `uname` = 'Darwin' ]; then
    brew bundle --file=$DOTFILES/../brew/Brewfile.mac
elif [ `uname` = 'Linux' ]; then
    brew bundle --file=$DOTFILES/../brew/Brewfile.linux
fi