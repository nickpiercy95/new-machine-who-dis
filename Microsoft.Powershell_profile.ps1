# If we're in system32, change to $env:HOME
$CurrentDir = $(Get-Location).Path
if ($CurrentDir -eq "C:\WINDOWS\system32") {
    Set-Location $env:HOME
}

Set-Alias ifconfig ipconfig

function xx {exit}

# Import Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Import-Module Posh-Git

# Shell-style tab completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Disable bell
Set-PSReadlineOption -BellStyle None
