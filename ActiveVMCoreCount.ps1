#Requires -RunAsAdministrator

Import-Module -Name "Hyper-V"

# Write-Host "Running VMs"

# Get-VM -VMName "*" -ComputerName jager| Where-Object -Property State -EQ "Running" | Format-Table Name
$runningCPUVM = Get-VM -VMName "*" -ComputerName jager | Where-Object -Property State -EQ "Running" | Select-Object -ExpandProperty Name

Write-Host "Current vCPU core count of running VMs"

ForEach ($vm in $runningCPUVM) {
    Get-VMProcessor -VMName $vm -ComputerName jager | Select-Object -Property VMName, Count
    # $runningCPUCount = Get-VMProcessor -VMName $vm -ComputerName jager
    # Write-Host $runningCPUCounts | Format-Table VMName, Count
}