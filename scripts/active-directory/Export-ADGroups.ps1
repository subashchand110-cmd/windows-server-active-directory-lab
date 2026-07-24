Import-Module ActiveDirectory

Get-ADGroup -Filter * |
Select Name, GroupScope, GroupCategory |
Export-Csv ".\ADGroups.csv" -NoTypeInformation

Write-Host "Groups exported."