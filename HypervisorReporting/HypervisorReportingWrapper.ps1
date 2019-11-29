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