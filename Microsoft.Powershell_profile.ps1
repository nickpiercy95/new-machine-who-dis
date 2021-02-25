if ((Get-Location).Path -eq "C:\WINDOWS\system32") {
    Set-Location $HOME
}

# Tell Git to use the Windows SSH library instead of its own, to avoid ssh-agent shenanigans
$env:GIT_SSH_COMMAND = (Get-Command ssh).Source.Replace('\' ,'/')

Set-Alias ifconfig ipconfig
Set-Alias host Resolve-DnsName
Set-Alias gitbash "C:\Program Files\Git\bin\bash.exe"
Remove-Item alias:diff -Force > $null 2>&1

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path "$ChocolateyProfile") {
    Import-Module "$ChocolateyProfile"
}

Import-Module Posh-Git
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
$GitPromptSettings.DefaultPromptPrefix.Text = "$(whoami)@$(hostname) "
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::DarkGreen

# Unix-style shortcuts
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

Set-PSReadlineOption -BellStyle None

$HOSTS = "C:\Windows\System32\drivers\etc\hosts"
