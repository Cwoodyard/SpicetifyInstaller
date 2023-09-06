# Compiled By V1p3r_hax 9/5/2023
# Powershell Script to install Spotify and Spicetify with Marketplace and the adblock plugin

Write-Host "Installing Spotify"
iwr -useb https://download.scdn.co/SpotifySetup.exe -OutFile "installer.exe"

Write-Host "Please close Spotify after it has installed!"
Start-Process .\installer.exe /Silent -Wait -PassThru

Write-Host "(Re)Installing Spicetify"
iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex

Write-Host "(Re)Installing Marketplace"
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1" | Invoke-Expression

Write-Host "(Re)Installing Adblock"
$Parameters = @{
  Uri             = 'https://raw.githubusercontent.com/CharlieS1103/spicetify-extensions/main/adblock/adblock.js'
  UseBasicParsing = $true
  OutFile         = "$env:APPDATA\spicetify\Extensions\adblock.js"
}
Invoke-WebRequest @Parameters

Write-Host "Adding adblock"
spicetify config extensions adblock.js
Write-Host "Applying Changes"
spicetify apply