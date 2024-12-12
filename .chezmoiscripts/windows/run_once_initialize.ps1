Write-Output "Initializing Windows environment..."
Write-Output ". ~/.config/powershell/Microsoft.PowerShell_profile.ps1" >> $PROFILE
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

## Change configuration
sudo config --enable enable
sudo config --enable disableInput

$enableSideloadingRegistry = "HKCM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
if (!(Test-Path $enableSideloadingRegistry)) {
    New-Item -Path $enableSideloadingRegistry -Force
}
Set-ItemProperty -Path $enableSideloadingRegistry -Name "AllowAllTrustedApps" -Value 1 # Enable sideloading

$endTaskBarRegistry = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings"
if (!(Test-Path $endTaskBarRegistry)) {
    New-Item -Path $endTaskBarRegistry -Force
}
Set-ItemProperty -Path $endTaskBarRegistry -Name "MMTaskbarMode" -Value 1 # Enable taskbar mode

$showFullPathInTitleBarRegistry = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState"
if (!(Test-Path $showFullPathInTitleBarRegistry)) {
    New-Item -Path $showFullPathInTitleBarRegistry -Force
}
Set-ItemProperty -Path $showFullPathInTitleBarRegistry -Name "FullPath" -Value 1 # Show full path in title bar

Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -value 0 # Show file extensions
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -value 1 # Show hidden files

$mouseCursorRegistry = "HKCU:\Control Panel\Cursors"
$cursorsPath = "C:\Users\{{.username}}\dotfiles\resources\cursors"
if (!(Test-Path $mouseCursorRegistry)) {
    New-Item -Path $mouseCursorRegistry -Force
}
# Change mouse cursor
Set-ItemProperty -Path $mouseCursorRegistry -Name "AppStarting" -Value $cursorsPath+"AppStarting.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "Arrow" -Value $cursorsPath+"Arrow.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "Crosshair" -Value $cursorsPath+"Crosshair.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "Hand" -Value $cursorsPath+"Hand.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "Help" -Value $cursorsPath+"Help.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "IBeam" -Value $cursorsPath+"IBeam.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "No" -Value $cursorsPath+"No.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "NWPen" -Value $cursorsPath+"NWPen.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "SizeAll" -Value $cursorsPath+"SizeAll.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "SizeNESW" -Value $cursorsPath+"SizeNESW.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "SizeNS" -Value $cursorsPath+"SizeNS.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "SizeNWSE" -Value $cursorsPath+"SizeNWSE.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "SizeWE" -Value $cursorsPath+"SizeWE.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "UpArrow" -Value $cursorsPath+"UpArrow.ani"
Set-ItemProperty -Path $mouseCursorRegistry -Name "Wait" -Value $cursorsPath+"Wait.ani"
