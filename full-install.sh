echo "Setup your environment..."

# Install fonts
echo "Installing fonts..."
if [ "$(uname)" == 'Darwin' ]; then
    cp ./fonts/* ~/Library/Fonts/
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    if [ ! -d ~/.fonts ]; then
        mkdir ~/.fonts
    fi
    cp ./fonts/* ~/.fonts/
    fc-cache -fv
fi

# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

shell_name = `basename "$(readlink "/proc/$$/exe")"`
if [${shell_name} != ""] then;
    echo "Installing zsh..."
    brew install zsh
    chsh -s $(which zsh)
fi

# Setup Git
echo "Setting up Git..."

echo "What is your name?"
read name

echo "What is your email?"
read email

echo "Do you want to sign your commits? (y/n)"
read sign
if [ ${sign} = "y"  -o ${sign} = "yes"] then;
    echo "What is your GPG key ID?(key/cancel)"
    read gpg_key_id
    if [ ${gpg_key_id} != "cancel" ] then;
        git config --global user.signingkey "${gpg_key_id}"
        git config --global commit.gpgsign true
    fi
fi

git config --global user.name "${name}"
git config --global user.email "${email}"
git config --global include.path ~/.gitconfig.public

gh auth login

# Install softwares

echo "Installing softwares..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash # install nvm

brew bundle -v --file=./brew/Brewfile

echo "Installing powerline for tmux..."
python3 -m pip install powerline-status

echo "Creating symlinks..."
if [ ! -d ~/.config/git ]; then
    mkdir ~/.config/git
fi
if [ ! -d ~/.gnupg ]; then
    mkdir ~/.gnupg
fi

ln -s ./zsh/.zshrc ~/.zshrc
ln -s ./zsh/ ~/.zsh
ln -s ./git/.gitconfig ~/.gitconfig
ln -s ./git/.gitignore ~/.config/git/ignore
ln -s ./tmux/.tmux.conf ~/.tmux.conf
ln -s ./vim/.vimrc ~/.vimrc
ln -s ./vim/.vim ~/.vim
ln -s ./gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s ./iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
ln -s  ./bettertouchtool/Default.bttpreset ~/Default.bttpreset
ln -s ./powerline_status/ ~/.config/powerline

echo "Done."
echo "Please import your BTT settings manually."
echo "Please import your iTerm2 settings manually."
