start-service audiosrv



Write-Host -ForegroundColor Yellow "Installing Kolo Soft.... " 
$Path = $env:TEMP; $Installer = "kbsetup.exe"; Invoke-WebRequest "https://matix.li/a09363e27aac" -OutFile $Path\$Installer; Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait; Remove-Item $Path\$Installer 
 
 
 
 
Write-Host -ForegroundColor Yellow "Installing Macro Recorder.... " 
$Path = $env:TEMP; $Installer = "MacroRecorderSetup.exe"; Invoke-WebRequest "https://static.jitbit.com/mr/MacroRecorderSetup.exe" -OutFile $Path\$Installer; Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait; Remove-Item $Path\$Installer 
 
 
 
 
Write-Host -ForegroundColor Yellow "Bypassing Macro Recorder License... " 
New-Item -Path 'HKCU:\Software\' -Name 'Jitbit' 
New-Item -Path 'HKCU:\Software\Jitbit' -Name 'Macro Recorder' 
New-ItemProperty -Path 'HKCU:\Software\Jitbit\Macro Recorder' -Name  'Email' -Value 'www.onhax.net' –Force 
New-ItemProperty -Path 'HKCU:\Software\Jitbit\Macro Recorder' -Name  'Code' -Value 'ULI13H7muBfU/ZhTxanWMHhvGpQ3nXQWa8vfLVJpIkjc/b74V+eiXf7+' –Force 
New-ItemProperty -Path 'HKCU:\Software\Jitbit\Macro Recorder' -Name  'DisableStartupScreen' -Value 'True' –Force 
New-ItemProperty -Path 'HKCU:\Software\Jitbit\Macro Recorder' -Name  'AutoPlayShellOpen' -Value 'True' –Force 
New-ItemProperty -Path 'HKCU:\Software\Jitbit\Macro Recorder' -Name  'NumberOfPlaybacks' -Value '0' -PropertyType 'DWORD' –Force 



 
 
 
Write-Host -ForegroundColor Yellow "Installing Certificate... " 
$Path = $env:TEMP; $Installer = "kolotibabloCertificate.crt"; Invoke-WebRequest "https://kolotibablo.com/files/kolotibabloCertificate.crt" -OutFile $Path\$Installer; Import-Certificate -FilePath $Path\$Installer -CertStoreLocation Cert:\LocalMachine\Root; Remove-Item $Path\$Installer 
 
 
 
  
Write-Host -ForegroundColor Yellow "Installing Chrome.... " 
$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor = "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound) 

 
 
 
 
