# If we're in system32, change to $HOME
$CurrentDir = (Get-Location).Path
if ($CurrentDir -eq "C:\WINDOWS\system32") {
    Set-Location $HOME
}

# Tell Git to use the SSH library included in Windows 10, rather than its own. See https://www.teapotcoder.com/post/how-to-fix-git-ssh-asking-for-password-on-windows-10/
$env:GIT_SSH_COMMAND = (Get-Command ssh).Source.Replace('\' ,'/')

Set-Alias ifconfig ipconfig

function xx {exit}

# Import Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Import-Module Posh-Git

# Unix-style tab completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Disable bell
Set-PSReadlineOption -BellStyle None
