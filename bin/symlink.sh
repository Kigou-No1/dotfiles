set -xeu
echo "Creating symlinks..."

DOTFILES=$(cd $(dirname $0) && pwd)

if [ ! -d $HOME/.config ]; then
    mkdir -p $HOME/.config
fi

if [ -e $HOME/.zshrc ]; then
    mv -f $HOME/.zshrc $HOME/.zshrc.bak
fi
ln -s $DOTFILES/../zsh/.zshrc $HOME/.zshrc

if [ -d $HOME/.zsh ]; then
    mv -f $HOME/.zsh $HOME/.zsh.bak
fi
ln -s $DOTFILES/../zsh/ $HOME/.zsh

if [ -e $HOME/.gitconfig.os ]; then
    mv -f $HOME/.gitconfig.os $HOME/.gitconfig.os.bak
fi

if [ -e $HOME/.gitconfig ]; then
    mv -f $HOME/.gitconfig $HOME/.gitconfig.bak
fi
ln -s $DOTFILES/../git/.gitconfig $HOME/.gitconfig

if [ `uname` = 'Darwin' ]; then
    ln -s $DOTFILES/../git/.gitconfig.mac $HOME/.gitconfig.os
elif [ `uname` = 'Linux' ]; then
    ln -s $DOTFILES/../git/.gitconfig.linux $HOME/.gitconfig.os
fi

mkdir -p $HOME/.config/git
if [ -e $HOME/.config/git/ignore ]; then
    mv -f $HOME/.config/git/ignore $HOME/.config/git/ignore.bak
fi
ln -s $DOTFILES/../git/.gitignore $HOME/.config/git/ignore

if [ -e $HOME/.tmux.conf ]; then
    mv -f $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi
ln -s $DOTFILES/../tmux/.tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.gnupg
if [ -e $HOME/.gnupg/gpg-agent.conf ]; then
    mv -f $HOME/.gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf.bak
fi
ln -s $DOTFILES/../gpg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf

mkdir -p $HOME/.config/powerline
if [ -d $HOME/.config/powerline ]; then
    mv -f $HOME/.config/powerline $HOME/.config/powerline.bak
fi
ln -s $DOTFILES/../powerline_status/ $HOME/.config/powerline

mkdir -p $HOME/.config/nvim
if [ -d $HOME/.config/nvim ]; then
    mv -f $HOME/.config/nvim $HOME/.config/nvim.bak
fi
ln -s $DOTFILES/../nvim/ $HOME/.config/nvim

mkdir -p $HOME/.ssh
if [ -e $HOME/.ssh/alloed_signers ]; then
    mv -f $HOME/.ssh/allowed_signers $HOME/.ssh/allowed_signers.bak
fi
ln -s $DOTFILES/../.ssh/allowed_signers $HOME/.ssh/allowed_signers
