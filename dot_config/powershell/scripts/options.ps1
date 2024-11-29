Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

## Use default node version
fnm env --use-on-cd | Out-String | Invoke-Expression
Import-Module -Name Microsoft.WinGet.CommandNotFound
