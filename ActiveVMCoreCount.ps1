#Requires -RunAsAdministrator

Import-Module -Name "Hyper-V"

$running = Get-VM -VMName "*" -ComputerName jager | Where-Object -Property State -EQ "Running" | Select-Object -ExpandProperty Name

Write-Host "Current vCPU core count of running VMs"

ForEach ($vm in $running) {
    Get-VMProcessor -VMName $vm -ComputerName jager | Select-Object -Property VMName, Count
}