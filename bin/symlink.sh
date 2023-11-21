echo "Creating symlinks..."

DOTFILES = "$HOME/dotfiles"

if [ ! -d ~/.config/git ]; then
    mkdir ~/.config/git
fi
if [ ! -d ~/.gnupg ]; then
    mkdir ~/.gnupg
fi

ln -s $DOTFILES/zsh/.zshrc ~/.zshrc
ln -s $DOTFILES/zsh/ ~/.zsh
ln -s $DOTFILES/git/.gitconfig ~/.gitconfig
ln -s $DOTFILES/git/.gitconfig.public ~/.gitconfig.public
ln -s $DOTFILES/git/.gitignore ~/.config/git/ignore
ln -s $DOTFILES/tmux/.tmux.conf ~/.tmux.conf
ln -s $DOTFILES/vim/.vimrc ~/.vimrc
ln -s $DOTFILES/vim/.vim ~/.vim
ln -s $DOTFILES/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s $DOTFILES/powerline_status/ ~/.config/powerline
ln -s $DOTFILES/nvim/ ~/.config/nvim
ln -s $DOTFILES/.ssh/allowed_signers ~/.ssh/allowed_signers
