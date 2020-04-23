<#

#>

$ErrorActionPreference = "stop"

Write-Host "`n          AVD Manager Utility"    `n -ForegroundColor Green   #Introduction

Add-Type -AssemblyName System.Windows.Forms #File selector dialog box initialisation

$myLocation = Get-Location #Get the location of the current powershell file and save it in the variable $myLocation

function chooseNewEmulatorPath {
  $newEmulatorPath = New-Object System.Windows.Forms.OpenFileDialog -Property @{Filter = 'Emulator.exe (*.exe)|*.exe' } #Set up dialog box to choose file. Allow selecting only ".exe" files.
  $null = $newEmulatorPath.ShowDialog() #Show the dialog box to choose a file
  Set-Content $myLocation\avd.path $newEmulatorPath.FileName #Overwrite the new path in the avd.path file
}


if (Test-Path $myLocation\avd.path) {

  if ($Null -ne (Get-Content $myLocation\avd.path)) {

    $emulatorPath = Get-Content $myLocation\avd.path #Get the path of emulator.exe saved in the avd.path file and save it in the variable $emulatorPath

    $deviceList = Invoke-Expression ($emulatorPath + " -list-avds") #Fetch the AVD list and save it in variable $deviceList. Example Path of emulator.exe -> C:\SomeRandomFolder\SDK\emulator\emulator.exe

    $i = 0; $deviceList | %{Write-Host `n($i+1) "->" $deviceList[$i]; $i++}; #Count the devices and display it line by line as numbered list
    Write-Host `n($i + 1) "-> Change AVD Path" #Settings

    $deviceID = Read-Host `n "Enter the Key of the AVD to be deployed"


    if ($deviceID -eq $i + 1) {

      $pathChangeConfirmation = (Read-Host `n" Do you want to change the path of the emulator.exe file (Y/N)")
    
      if ($pathChangeConfirmation -eq 'Y') {
        chooseNewEmulatorPath #Show the file selector dialog box to select emulator.exe file
        Write-Host `n"Re-execute the Program to launch AVD"
      }

      else { Write-Host "Aborted" }
    }

    else {

      Write-Host "`n Deploying AVD:"$deviceList[$deviceID - 1] -BackgroundColor Green -ForegroundColor Black #Give some information of the AVD being deployed
      pause #Wait until user clicks ENTER
      $device = $deviceList[$deviceID - 1]
      $deploy = "$emulatorPath -avd $device"
      #Invoke-Expression $deploy | out-null #Deploy the AVD   
    }
  }    

  else {
    Read-Host "The path of emulator.exe is not defined. Press ENTER to define Path"
    chooseNewEmulatorPath #Show the file selector dialog box to select emulator.exe file
    Write-Host`n "Done. Re-execute the program to launch AVD"
  }
}

else {
  Read-Host "Press ENTER to choose the emulator.exe file location"
  New-Item $myLocation\avd.path | out-null #Create a file avd.path in the same directory as the script
  chooseNewEmulatorPath #Show the file selector dialog box to select emulator.exe file
  Write-Host `n "Done. Re-execute the program to launch AVD"
}