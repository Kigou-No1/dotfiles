## fnm auto-completion
Invoke-Expression -Command $(fnm completions --shell power-shell | Out-String)
## Github CLI Auto-Completion
Invoke-Expression -Command $(gh completion -s powershell | Out-String)
## 1Password CLI Auto-Completion
Invoke-Expression -Command $(op completion powershell | Out-String)
## Zoxide CLI Auto-Completion
Invoke-Expression (& { (zoxide init powershell | Out-String) })
## Starship CLI Auto-Completion
Invoke-Expression (& { (starship init powershell | Out-String) })
## Chezmoi CLI Auto-Completion
Invoke-Expression -Command $(chezmoi completion powershell | Out-String)
## Tailscale CLI Auto-Completion
Invoke-Expression -Command $(tailscale completion powershell | Out-String)
# winget auto-completion
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
