$hostname = Read-Host "Enter hostname"

$hostname = $hostname + ".$env:USERDNSDOMAIN"
$reach = $true

do {
    if ((Test-Connection -ComputerName $hostname -Quiet) -eq $true) {
        Write-Host "$hostname is reachable"
    }
    else {
        [console]::beep(500,100) 
    }
} 
while ($reach = $true)

