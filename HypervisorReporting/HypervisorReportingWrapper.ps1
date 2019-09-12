#Requires -RunAsAdministrator

$computer = Read-Host -Prompt "Enter in the hostname of the hypervisor you are querying:"
$session = New-PSSession -ComputerName $computer

Invoke-Command -Session $session -ScriptBlock {
    $shareLiteral = Read-Host -Prompt "Enter in the share location where the scripts are located:"
    New-PSDrive -Name "Share" -Root $shareLiteral -PSProvider "FileSystem"
}

Invoke-Command -Session $session -ScriptBlock {
    Share:\ActiveRAMUsage.ps1
    Share:\ActiveVMCoreCount.ps1
    Share:\VMStorageUsed.ps1
}

# .\VMStorageUsed.ps1
# Clear-Variable running* -Scope Global
# Write-Host "Sleeping for 2 seconds"
# Start-Sleep -Seconds 2

# .\ActiveRAMUsage.ps1
# Clear-Variable running* -Scope Global
# Write-Host "Sleeping for 5 seconds"
# Start-Sleep -Seconds 5

# .\ActiveVMCoreCount.ps1

# Pause