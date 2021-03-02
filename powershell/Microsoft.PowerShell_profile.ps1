### In admin PowerShell:
# PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
# New-Item -ItemType SymbolicLink -Path "$env:userprofile\Documents\WindowsPowerShell" -Target "$env:userprofile\Documents\PowerShell"
#
# Then move this file to: %userprofile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# posh-git
Import-Module posh-git
$GitPromptSettings.DefaultPromptPrefix.Text = '$(Get-Date -f "[HH:mm:ss]") '
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::DarkGray
