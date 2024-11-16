alias lc="limactl"

alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gst="git status"
alias gadd="git add"
alias gcm="git commit -m"
alias gps="git push"
alias gpl="git pull"

alias ls="eza -la --icons"
alias cat="batcat"
alias find="fd -H"
alias fd="fd -H"
alias grep="grep --color=auto"
alias cpwd="pwd | tr -d '\n' | pbcopy"

alias rl="source ~/.zshrc"

alias vim="nvim"
alias vi="nvim"

alias edit="code-insiders"
alias code="code-insiders"

# chezmoi
alias ch-gadd="chezmoi git -- add "
alias ch-gcm="chezmoi git -- commit -m "
alias ch-gps="chezmoi git push"
alias ch-gst="chezmoi git status"
