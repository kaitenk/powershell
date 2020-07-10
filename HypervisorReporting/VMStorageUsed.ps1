Import-Module -Name "Hyper-V"

Write-Host "Current usage of VM storage"

Add-Type -AssemblyName System.Windows.Forms

$fileBrowser = New-Object System.Windows.Forms.FolderBrowserDialog 

$fileBrowser.ShowNewFolderButton = $false
$fileBrowser.Description = "Select the directory containing Hyper-V VMs"
[void]$fileBrowser.ShowDialog((New-Object System.Windows.Forms.Form -Property @{TopMost = $true}))
 
# $vmStorage = Get-PSDrive -PSProvider FileSystem | Where-Object -FilterScript { $_.Name -NE "C" -and $_.Root -notlike '\\*' }

foreach ($disk in $vmStorage) {
   $diskSize = [Math]::Truncate($disk.Size/1gb)
   $diskUsed = Get-PSDrive -Name (Get-Volume -FilePath $disk.Path)
}

$running = Get-VM | Where-Object -Property State -EQ "Running" | Select-Object -ExpandProperty Name

Write-Host "Storage used by VHDs"

ForEach ($vm in $running) {
    $VHDs = Get-VMHardDiskDrive -VMName $vm | Select-Object -ExpandProperty Path 
    Get-VHD -Path $VHDs Select-Object Path, @{Name="Size";Expression = {$_.FileSize/1gb}}
    }