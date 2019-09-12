#Requires -RunAsAdministrator
#Requires -Modules ActiveDirectory

Import-Module ActiveDirectory

Add-Type -AssemblyName PresentationFramework

Write-Host "WARNING: THIS INVOLVES CREATING A KDS ROOT KEY ON ALL DOMAIN CONTROLLERS FOR MANAGED SERVICE ACCOUNT PASSWORD AUTOMATION" -BackgroundColor White -ForegroundColor Red
Write-Host "If you do not know what this, close this window and search KDS for gMSAs" -BackgroundColor White -ForegroundColor Red

Write-Host "Do you wish to continue? y / n " -BackgroundColor White -ForegroundColor Red 
$disclosure = Read-Host
switch ($disclosure) {
    Y {
        Write-Host "Continuing on..."
        continue
    }
    N {
        Write-Host "No changes enacted" -BackgroundColor White -ForegroundColor Red
        Break
    }
    Default {
        Write-Host "No input detected, no changes enacted" -BackgroundColor White -ForegroundColor Red 
        Break}
    }

$username = @(Read-Host "Enter the username of the account you want to create")

$computer = @(Read-Host "Enter the hostname of the machine that will use the service account")

$multipleAcc = Read-Host "Would you like to create more accounts? y / n"

switch ($multipleAcc) {
    Y {$username += Read-Host "Enter another username for the account you want to create"}
    N {Write-Host "Continuing on..."}
    Default {Write-Host "Input invalid, continuing on..."}
}

$multipleComp = Read-Host "Are you planning on using these accounts on mulitple machines? Y / N"

switch ($multipleComp) {
    Y {$computer += Read-Host "Enter another hostname to use the managed service accounts"}
    N {Write-Host "Continuing on..."}
    Default {Write-Host "Input invalid, continuing on..."}
}

# $password = Get-Credential -Message ""

Write-Host "Attempting to create managed service account(s) now!"

ForEach ($user in $username) {
    New-ADServiceAccount -Name $user -DisplayName $user -Verbose
}