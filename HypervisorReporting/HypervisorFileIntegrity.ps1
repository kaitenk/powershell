#Check for file from pre-determined folder

# $scriptFolder = "C:\PowerShellScripts"

if (Test-Path -Path "C:\PowerShellScripts") {
    
    $integrityCheck = Get-ChildItem -Path $scriptFolder
    $scriptNames = "VMStorageUsed"."ActiveRAMUsage","ActiveVMCoreCount"

    if ($integrityCheck -eq $scriptNames) {
        Write-Host "Good to go!" -BackgroundColor DarkCyan  
    }
    else {
        Write-Host "There are some files missing in the PowerShell Folder in C:\"
        Pause  
    }
} 
else {
    Write-Host "The PowerShellScripts folder was not found in C:\."
    Pause
}