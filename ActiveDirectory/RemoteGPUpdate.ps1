$computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty "Name" 

Invoke-Command -AsJob -ComputerName $computers -ScriptBlock {
    Invoke-GPUpdate -Force
}