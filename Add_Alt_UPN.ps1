####################################################################################
#Adds an alternative upn suffix to a list of users, defined by their SamAccountName#
####################################################################################

Import-Module activedirectory

# List of users to modify
$Users_to_change = @('Admin', 'I2165cF')

# UPN suffix to add to these users
$New_suffix = "BDF-CRYPTO.LOCAL"

# Create de request to get the wanted users
$Filter = 'SamAccountName -eq "' + $Users_to_change[0] + '"'

foreach ($user_to_change in $Users_to_change[1..($Users_to_change.Length - 1)]){
   $Filter += ('-or SamAccountName -eq "' + $user_to_change + '"')
}

# Modify teh user objects
Get-ADUser -filter $Filter | foreach { Set-ADUser $_ -UserPrincipalName ("{0}@{1}" -f $_.userPrincipalName.Split("@")[0],$New_suffix)}