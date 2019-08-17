#Requires -RunAsAdministrator

.\VMStorageUsed.ps1
Clear-Variable running* -Scope Global
Write-Host "Sleeping for 2 seconds"
Start-Sleep -Seconds 2

.\ActiveRAMUsage.ps1
Clear-Variable running* -Scope Global
Write-Host "Sleeping for 5 seconds"
Start-Sleep -Seconds 5

.\ActiveVMCoreCount.ps1

Pause