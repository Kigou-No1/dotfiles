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

echo "Done."
echo "Please import your BTT settings manually."
echo "Please import your iTerm2 settings manually."
