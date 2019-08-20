#Requires -RunAsAdministrator

Import-Module -Name "Hyper-V"

Write-Host "Current usage of VM storage"

Invoke-Command -ScriptBlock {
    $vmStorage = Get-PSDrive -Name V

    $vmStorageFree = $vmStorage.Free/1gb
    $vmStorageUsed = $vmStorage.Used/1gb
    $vmStorageTotal = $vmStorageFree+$vmStorageUsed

    Write-Host $vmStorageFree.ToString("#.#")  "/"  $vmStorageTotal.ToString("#.#")GB
}

$running = Get-VM -VMName "*" | Where-Object -Property State -EQ "Running" | Select-Object -ExpandProperty Name

Write-Host "Storage used by VHDs"

ForEach ($vm in $running) {
    $VHDs = Get-VMHardDiskDrive -VMName $vm | Select-Object -ExpandProperty Path 
    Get-VHD -Path $VHDs Select-Object Path, @{Name="Size";Expression = {$_.FileSize/1gb}}
    }