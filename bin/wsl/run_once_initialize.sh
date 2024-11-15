{{ if .performInitialize }}
{{ if eq .chezmoi.os "linux" }}
{{ if (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}

sudo timedatectl set-timezone Asia/Tokyo

sudo cp /etc/apt/sources.list.d/ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources.bak
sudo sed -i 's|http[s]*://[a-zA-Z0-9./-]*/ubuntu|https://mirrors.cat.net/ubuntu|g' /etc/apt/sources.list.d/ubuntu.sources
sudo apt update -y && sudo apt upgrade -y
sudo apt install asdf bat build-essential \
                cloudflared curl docker fd \
                fzf gcc gh git gnupg g++ jq\
                libtool make neofetch ripgrep \
                tmux tree unzip wget zoxide zsh -y

# Add authorized_keys
# curl -s https://github.com/Kigou-No1.keys > ~/.ssh/authorized_keys
# chmod 600 ~/.ssh/authorized_keys

# Install development runtimes
asdf plugin-add nodejs
asdf plugin-add python

asdf install nodejs latest
asdf install python latest

asdf global nodejs latest
asdf global python latest

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y # Install rust silently

cargo install sheldon # Install Zsh package manager

mkdir -p ~/repo/github.com/Kigou-No1

{{ end}}
{{ end}}
{{ end}}