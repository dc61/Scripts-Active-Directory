Remove-ADUser -Identity "john.doe" -Confirm

#Et pour vérifier son identité avant : 

Get-ADUser -Identity "john.doe"

# Ne pas oublier le :

Import-Module ActiveDirectory
