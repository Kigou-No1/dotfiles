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

