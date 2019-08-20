#Requires -RunAsAdministrator

Import-Module -Name "Hyper-V"

$running = Get-VM -VMName "*" | Where-Object -Property State -EQ "Running" | Select-Object -ExpandProperty Name

Write-Host "Current vCPU core count of running VMs"

ForEach ($vm in $running) {
    Get-VMProcessor -VMName $vm -ComputerName | Select-Object -Property VMName, Count
}