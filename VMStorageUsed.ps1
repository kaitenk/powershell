#Requires -RunAsAdministrator

Import-Module -Name "Hyper-V"

Write-Host "Current usage of VM storage"

Invoke-Command -ComputerName jager -ScriptBlock {
    $vmStorage = Get-PSDrive -Name V

    $vmStorageFree = $vmStorage.Free/1gb
    $vmStorageUsed = $vmStorage.Used/1gb
    $vmStorageTotal = $vmStorageFree+$vmStorageUsed

    Write-Host $vmStorageFree.ToString("#.#")  "/"  $vmStorageTotal.ToString("#.#")GB
}

$running = Get-VM -VMName "*" -ComputerName jager | Where-Object -Property State -EQ "Running" | Select-Object -ExpandProperty Name

Write-Host "Storage used by VHD"

ForEach ($vm in $running) {
    $VHDs = Get-VMHardDiskDrive -VMName $vm -ComputerName jager | Select-Object -ExpandProperty Path 
    # $VHDSize = Get-VHD -Path $VHDs -ComputerName jager | Select-Object Path, @{Name="Size";Expression = {$_.FileSize/1gb}}
    Get-VHD -Path $VHDs -ComputerName jager | Select-Object Path, @{Name="Size";Expression = {$_.FileSize/1gb}}
    # Out-Host -InputObject $VHDSize
    }