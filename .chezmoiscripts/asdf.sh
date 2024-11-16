. "$HOME/.asdf/asdf.sh"

asdf plugin-add nodejs
asdf plugin-add python
asdf plugin-add chezmoi 
asdf plugin-add starship


asdf install nodejs latest
asdf install python latest
asdf install chezmoi 2.54.0
asdf install starship latest

asdf global nodejs latest
asdf global python latest
asdf global chezmoi 2.54.0
asdf global starship latest