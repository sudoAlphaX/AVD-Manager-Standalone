<#

#>

Write-Host "`n          AVD Manager Utility"    `n -ForegroundColor Green   #Introduction


$ps1Location = Get-Location
#Get the location of the current powershell file and save it in the variable $ps1Location

$emulatorPath = Get-Content $ps1Location\config.ini
#Get the path of emulator.exe saved in the config.ini file and save it in the variable $emulatorPath

$deviceList = Invoke-Expression ($emulatorPath + " -list-avds")
#Fetch the AVD list and save it in variable $deviceList. Example Path of emulator.exe -> C:\SomeRandomFolder\SDK\emulator\emulator.exe

$i = 0; $deviceList | %{Write-Host `n($i+1) "->" $deviceList[$i]; $i++}; #Count the devices and display it line by line as numbered list
Write-Host `n($i+1) "-> Change AVD Path" #Settings
$StartDevice = Read-Host `n "Enter the Key of the AVD to be deployed"


Write-Host "`n Deploying AVD: "$deviceList[$StartDevice-1] #Give some information of the AVD being deployed

#$basepath+"\emulator.exe  -avd $devices[$StartDevice-1] | out-null" #Actual command to deploy the AVD