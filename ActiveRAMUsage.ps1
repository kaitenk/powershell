#Requires -RunAsAdministrator

Import-Module -Name "Hyper-V"

Write-Host "Current RAM usage running VMs"

$currentRAMUsageVM = Get-VM -VMName "*" | Where-Object -Property State -EQ "Running" | Select-Object VMName, @{Name="MemoryAssigned";Expression = {$_.MemoryAssigned/1mb}}, @{Name="MemoryDemand";Expression = {$_.MemoryDemand/1mb}}, MemoryStatus

Out-Host -InputObject $currentRAMUsageVM

Write-Host "Current RAM usage of hypervisor"

$OS = Get-CimInstance Win32_OperatingSystem -ComputerName
$totalMemory = $os.TotalVisibleMemorySize/1mb
$freeMemory = $os.FreePhysicalMemory/1mb
$usedMemory = $totalMemory-$freeMemory

Write-Host $usedMemory.ToString("#.#")  "/"  $totalMemory.ToString("#.#")GB