Set-Alias -Name grep -Value rg
Set-Alias -Name which -Value Get-Command
Set-Alias -Name touch -Value New-Item
Set-Alias -Name code -Value $ENV:EDITOR
Set-Alias -Name edit -Value $ENV:EDITOR

function cat {
    bat --style=plain
}

function ls {
    eza --icons
}

function la {
    eza -la --icons
}

function ll {
    eza -ll --icons
}

function tree {
    eza -T --icons
}

function glog {
    git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
}

function gst {
    git status
}

function gadd {
    git add
}

function gcm {
    git commit -m
}

function gps{
    git push
}

function gpl {
    git pull
}
