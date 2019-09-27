Get-Module ActiveDirectory

$hostNames = Get-ADComputer -Filter * -SearchBase "OU=Domain Computers, DC=kkala, DC=internal" | Select-Object -ExpandProperty "Name"

foreach ($computer in $hostNames) {
    $ip = Resolve-DnsName -Name $computer | Select-Object -ExpandProperty IP4Address 
    Write-Host $computer, $ip 
}