DOTFILES=$(cd $(dirname $0) && pwd)
brew bundle --file=$DOTFILES/../brew/Brewfile.extra
