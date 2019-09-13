$computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty "Name" 
# foreach ($computer in $computers) {
#     Invoke-GPUpdate -Force -Computer $computer -Verbose -ErrorAction SilentlyContinue -AsJob
#     Invoke-Command -ComputerName $computer -ScriptBlock {hostname} -ErrorAction SilentlyContinue
# }

Invoke-AsWorkflow -PSComputerName $computers -CommandName Invoke-GPUpdate