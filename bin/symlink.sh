set -xeu
echo "Creating symlinks..."

DOTFILES=$(cd $(dirname $0) && pwd)

if [! -d ~/.config ]; then
    mkdir -p ~/.config
fi

if [ -e ~/.zshrc ]; then
    mv -f ~/.zshrc ~/.zshrc.bak
fi
ln -s $DOTFILES/../../zsh/.zshrc ~/.zshrc

if [ -d ~/.zsh ]; then
    mv -f ~/.zshenv ~/.zshenv.bak
fi
ln -s $DOTFILES/../zsh/ ~/.zsh

if [ -e ~/.gitconfig ]; then
    mv -f ~/.gitconfig ~/.gitconfig.bak
fi
ln -s $DOTFILES/../git/.gitconfig ~/.gitconfig

if [ -e ~/.gitconfig.public ]; then
    mv -f ~/.gitconfig.public ~/.gitconfig.public.bak
fi
ln -s $DOTFILES/../git/.gitconfig.public ~/.gitconfig.public

mkdir -p ~/.config/git
if [ -e ~/.config/git/ignore ]; then
    mv -f ~/.config/git/ignore ~/.config/git/ignore.bak
fi
ln -s $DOTFILES/../git/.gitignore ~/.config/git/ignore

if [ -e ~/.tmux.conf ]; then
    mv -f ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -s $DOTFILES/../tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.gnupg
if [ -e ~/.gnupg/gpg-agent.conf ]; then
    mv -f ~/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf.bak
fi
ln -s $DOTFILES/../gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

mkdir -p ~/.config/powerline
if [ -d ~/.config/powerline ]; then
    mv -f ~/.config/powerline ~/.config/powerline.bak
fi
ln -s $DOTFILES/../powerline_status/ ~/.config/powerline

mkdir -p ~/.config/nvim
if [ -d ~/.config/nvim ]; then
    mv -f ~/.config/nvim ~/.config/nvim.bak
fi
ln -s $DOTFILES/../nvim/ ~/.config/nvim

mkdir -p ~/.ssh
if [ -e ~/.ssh/alloed_signers ]; then
    mv -f ~/.ssh/allowed_signers ~/.ssh/allowed_signers.bak
fi
ln -s $DOTFILES/../.ssh/allowed_signers ~/.ssh/allowed_signers
