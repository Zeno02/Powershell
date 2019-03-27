  #Name: PCInfo
	#Script URI: https://github.com/Zeno02/Powershell/PCINFO
	#Description: Haalt informatie op over computeronderdelen
	#Version: versie 1.0.0
	#Author: Zeno Schoen
	#Author URI: https://github.com/Zeno02

CLS # Cleared je scherm
Write-Host "-------------------- PC Info --------------------"
$date = Get-Date
Write-Host "Current Date and Time : " $date
Write-Host "Computername          : " $env:COMPUTERNAME
Write-Host "Username              : " $env:USERNAME
Write-Host "OS                    : " $env:OS
Write-Host "-------------------- Disk -----------------------"
$disk = Get-Disk -Number 0
Write-Host "Disk 0 Type           : " $disk.FriendlyName
Write-Host "Disk 0 Size in bytes  : " $disk.AllocatedSize
Write-Host "-------------------- Wifi -----------------------"
$wifi = Get-NetAdapter | Where-Object {$_.Name -eq "Wi-Fi"}
Write-Host "Interface Description : " $wifi.InterfaceDescription
Write-Host "Interface Link-Speed  : " $wifi.LinkSpeed
Write-Host "Interface Status      :  " -NoNewline
Write-Host  $wifi.Status -ForegroundColor Green 
Write-Host "-------------------- RAM ------------------------"
$ram = Get-WmiObject "win32_physicalmemory" | Where-Object {$_.Name -eq "Fysiek Geheugen"}
Write-Host "PartNumber            : " $ram.PartNumber
Write-Host "Serial Number         : " $ram.SerialNumber
Write-Host "Speed                 : " $ram.Speed
Write-Host "-------------------- CPU ------------------------"
$cpu = Get-WmiObject "win32_processor" | Where-Object {$_.DeviceID -eq "CPU0"}
Write-Host "Name                  : " $cpu.Name
Write-Host "Info               : " $cpu.Caption
Write-Host "Max Clockspeed        : " $cpu.MaxClockSpeed
Write-Host "Status                :  "  -NoNewline
Write-Host  $cpu.Status -ForegroundColor Green
Write-Host "-------------------- Graphics Card ------------------------"
$card = Get-wmiObject "win32_videocontroller" | Where-Object {$_.DeviceID -eq "VideoController1"}
Write-Host "Name                  : " $card.Caption
Write-Host "Driver                : " $card.DriverVersion
Write-Host "Screen Resolution     : " $card.VideoModeDescription
Write-Host "Resfresh Rate         : " $card.CurrentRefreshRate
Write-Host "Status                :  " -NoNewline
Write-Host  $card.Status -ForegroundColor Green
