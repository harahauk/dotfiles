Write-Host "Attempting to stop HNS service..."
# [source](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/write-eventlog?view=powershell-5.1)
# Write-EventLog -LogName "Application" -Source "MyApp" -EventID 3001 -EntryType Information -Message "MyApp added a user-requested feature to the display." -Category 1 -RawData 10,20
Stop-Service HNS -Force
Write-Host "Attempting to restart SharedAccess service..."
Restart-Service SharedAccess
Write-Host "Attempting to start HNS service..."
Start-Service HNS
