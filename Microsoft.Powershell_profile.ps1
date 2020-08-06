if ((Get-Location).Path -eq "C:\WINDOWS\system32") {
    Set-Location $HOME
}

# Tell Git to use the SSH library included in Windows 10 instead of its own, to avoid ssh-agent shenanigans.
$env:GIT_SSH_COMMAND = (Get-Command ssh).Source.Replace("\" ,"/")

Set-Alias ifconfig ipconfig
Set-Alias host Resolve-DnsName
Remove-Item alias:diff -Force

function xx {exit}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path "$ChocolateyProfile") {
    Import-Module "$ChocolateyProfile"
}

Import-Module Posh-Git

# Unix-style tab completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Disable bell
Set-PSReadlineOption -BellStyle None
