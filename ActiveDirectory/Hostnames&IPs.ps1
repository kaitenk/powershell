#Requires -Module ActiveDirectory
 
$OU = Get-ADOrganizationalUnit -Filter 'Name -like "Domain Computers"'

$hostNames = Get-ADComputer -Filter * -SearchBase "OU=Domain Computers, DC=kkala, DC=internal" | Select-Object -ExpandProperty "Name"

foreach ($computer in $hostNames) {
    $ip = Resolve-DnsName -Name $computer -Type A | Select-Object -ExpandProperty IP4Address -ErrorAction Inquire
    Write-Host $computer, $ip 
}