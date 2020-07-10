$hostname = Read-Host "Enter hostname"

$hostname = $hostname + ".$env:USERDNSDOMAIN"
$reach = $true

do {
    if ((Test-Connection -ComputerName $hostname -Quiet) -eq $true) {
        Write-Host "$hostname is reachable"
        Write-Host "Press CTRL+C to stop"
    }
    else {
        [console]::beep(500,100)
        Write-Host "Press CTRL+C to stop" 
    }
} 
while ($reach = $true)