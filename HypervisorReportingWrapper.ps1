#Requires -RunAsAdministrator

.\VMStorageUsed.ps1
Clear-Variable running* -Scope Global
.\ActiveRAMUsage.ps1
Clear-Variable running* -Scope Global
.\ActiveVMCoreCount.ps1