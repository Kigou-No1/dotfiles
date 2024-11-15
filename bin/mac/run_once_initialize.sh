{{ if .performInitialize }}
{{ if -eq .chezmoi.os "darwin" }}

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle --file=$DOTFILES/../brew/Brewfile.mac

# Install development runtimes
asdf plugin-add nodejs
asdf plugin-add python

asdf install nodejs latest
asdf install python latest

asdf global nodejs latest
asdf global python latest

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y # Install rust silently

mkdir -p ~/repo/github.com/Kigou-No1

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool TRUE
defaults write bluetoothaudiod "Enable AptX codec" -bool true
defaults write bluetoothaudiod "Enable AAC codec" -bool true
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
defaults write com.apple.finder AppleShowAllFiles YES
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write com.apple.TextEdit RichText -int 0
defaults write -g ApplePressAndHoldEnabled -bool false

{{ end}}
{{ end}}