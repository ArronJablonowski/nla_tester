<#
.Synopsis
   NLA_Tester.ps1 Simplifies & automates connections to an RDP session with NLA disabled.   

.DESCRIPTION
 Script by:  Arron Jablonowski 
 
 This script will write out an RPD file and run it, to demonstrate the need for NLA (Network Level Authentication).
 When NLA is disabled it can allow an attacker to see your Windows lock/login screen and potentially usernames.    

.EXAMPLE
    .\NLA_Tester.ps1 -target <ip>
    .\NLA_Tester.ps1 -target <host>
    .\NLA_tester.ps1 -target 69.211.135.247

.LINK
    https://www.darkoperator.com/blog/2012/3/17/configuring-network-level-authentication-for-rdp.html

    https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-allow-access

#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$target
)

#var to hold path to temp.rdp
$rdpFile = "$env:LOCALAPPDATA\Temp\temp.rdp"

#If a previous RDP file exists, remove it. 
If((Test-Path "$rdpFile")){
    Remove-Item -Path $rdpFile -Force
}

#Make temp folder in appdata local if it doesn't exist 
If(!(Test-Path "$env:LOCALAPPDATA\Temp")){
    New-Item -ItemType Directory -Force -Path "$env:LOCALAPPDATA\Temp"
}


function makeRdpFile() {
    Add-Content -Path $rdpFile -Value "screen mode id:i:2"
    Add-Content -Path $rdpFile -Value "use multimon:i:0"
    Add-Content -Path $rdpFile -Value "desktopwidth:i:800"
    Add-Content -Path $rdpFile -Value "desktopheight:i:600"
    Add-Content -Path $rdpFile -Value "session bpp:i:32"
    Add-Content -Path $rdpFile -Value "winposstr:s:0,3,0,0,800,600"
    Add-Content -Path $rdpFile -Value "compression:i:1"
    Add-Content -Path $rdpFile -Value "keyboardhook:i:2"
    Add-Content -Path $rdpFile -Value "audiocapturemode:i:0"
    Add-Content -Path $rdpFile -Value "videoplaybackmode:i:1"
    Add-Content -Path $rdpFile -Value "connection type:i:7"
    Add-Content -Path $rdpFile -Value "networkautodetect:i:1"
    Add-Content -Path $rdpFile -Value "bandwidthautodetect:i:1"
    Add-Content -Path $rdpFile -Value "displayconnectionbar:i:1"
    Add-Content -Path $rdpFile -Value "enableworkspacereconnect:i:0"
    Add-Content -Path $rdpFile -Value "disable wallpaper:i:0"
    Add-Content -Path $rdpFile -Value "allow font smoothing:i:0"
    Add-Content -Path $rdpFile -Value "allow desktop composition:i:0"
    Add-Content -Path $rdpFile -Value "disable full window drag:i:1"
    Add-Content -Path $rdpFile -Value "disable menu anims:i:1"
    Add-Content -Path $rdpFile -Value "disable themes:i:0"
    Add-Content -Path $rdpFile -Value "disable cursor setting:i:0"
    Add-Content -Path $rdpFile -Value "bitmapcachepersistenable:i:1"
    Add-Content -Path $rdpFile -Value "full address:s:$target"
    Add-Content -Path $rdpFile -Value "audiomode:i:0"
    Add-Content -Path $rdpFile -Value "redirectprinters:i:1"
    Add-Content -Path $rdpFile -Value "redirectcomports:i:0"
    Add-Content -Path $rdpFile -Value "redirectsmartcards:i:1"
    Add-Content -Path $rdpFile -Value "redirectclipboard:i:1"
    Add-Content -Path $rdpFile -Value "redirectposdevices:i:0"
    Add-Content -Path $rdpFile -Value "autoreconnection enabled:i:1"
    Add-Content -Path $rdpFile -Value "authentication level:i:2"
    Add-Content -Path $rdpFile -Value "prompt for credentials:i:0"
    Add-Content -Path $rdpFile -Value "negotiate security layer:i:1"
    Add-Content -Path $rdpFile -Value "remoteapplicationmode:i:0"
    Add-Content -Path $rdpFile -Value "alternate shell:s:"
    Add-Content -Path $rdpFile -Value "shell working directory:s:"
    Add-Content -Path $rdpFile -Value "gatewayhostname:s:"
    Add-Content -Path $rdpFile -Value "gatewayusagemethod:i:4"
    Add-Content -Path $rdpFile -Value "gatewaycredentialssource:i:4"
    Add-Content -Path $rdpFile -Value "gatewayprofileusagemethod:i:0"
    Add-Content -Path $rdpFile -Value "promptcredentialonce:i:0"
    Add-Content -Path $rdpFile -Value "gatewaybrokeringtype:i:0"
    Add-Content -Path $rdpFile -Value "use redirection server name:i:0"
    Add-Content -Path $rdpFile -Value "rdgiskdcproxy:i:0"
    Add-Content -Path $rdpFile -Value "kdcproxyname:s:"
    Add-Content -Path $rdpFile -Value "enablecredsspsupport:i:0"
}

#Call makeRdpFile function 
makeRdpFile

#Call the rdp config file to launch Windows RDP client 
& $rdpFile