set -xeu
echo "Creating symlinks..."

DOTFILES=$(cd $(dirname $0) && pwd)

mv -f ~/.zshrc ~/.zshrc.bak
ln -s $DOTFILES/../../zsh/.zshrc ~/.zshrc

mv -f ~/.zsh ~/.zsh.bak
ln -s $DOTFILES/../zsh/ ~/.zsh

mv -f ~/.gitconfig ~/.gitconfig.bak
ln -s $DOTFILES/../git/.gitconfig ~/.gitconfig

mv -f ~/.gitconfig.public ~/.gitconfig.public.bak
ln -s $DOTFILES/../git/.gitconfig.public ~/.gitconfig.public

mkdir -p ~/.config/git
mv -f ~/.config/git/ignore ~/.config/git/ignore.bak
ln -s $DOTFILES/../git/.gitignore ~/.config/git/ignore

mv -f ~/.tmux.conf ~/.tmux.conf.bak
ln -s $DOTFILES/../tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/gnupg
mv -f ~/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf.bak
ln -s $DOTFILES/../gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

mkdir -p ~/.config/powerline
mv -f ~/.config/powerline ~/.config/powerline.bak
ln -s $DOTFILES/../powerline_status/ ~/.config/powerline

mkdir -p ~/.config/nvim
mv -f ~/.config/nvim ~/.config/nvim.bak
ln -s $DOTFILES/../nvim/ ~/.config/nvim

mkdir -p ~/.config/karabiner
mv -f ~/.ssh/allowed_signers ~/.ssh/allowed_signers.bak
ln -s $DOTFILES/../.ssh/allowed_signers ~/.ssh/allowed_signers
