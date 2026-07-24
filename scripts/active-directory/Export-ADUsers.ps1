# Import the Active Directory module
Import-Module ActiveDirectory

# Export all Active Directory users
Get-ADUser -Filter * -Properties Department, Enabled |
Select-Object Name, SamAccountName, Department, Enabled |
Export-Csv -Path ".\ADUsers.csv" -NoTypeInformation

Write-Host "Active Directory users exported successfully to ADUsers.csv" -ForegroundColor Green