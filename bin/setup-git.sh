set -xeu
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing..."
    brew install git
    echo "Git is installed."
fi

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
