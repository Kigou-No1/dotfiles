$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
$ENV:FZF_DEFAULT_OPTS="--height 40% --border --reverse "
$ENV:EDITOR="code-insiders"
$scripts = "$HOME/.config/powershell/scripts"
Get-ChildItem $scripts -Filter "*.ps1" | ForEach-Object { . $_.FullName }
