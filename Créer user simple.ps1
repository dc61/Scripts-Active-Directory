New-ADUser -Name "Bob" `
           -DisplayName "Bob ALICE" `
           -GivenName "Bob" `
           -Surname "ALICE" `
           -SamAccountName "bob.alice" `
           -UserPrincipalName "bob.alice@studi.local" `
           -EmailAddress "bob.alice@studi.local" `
           -Path "OU=*Compta,DC=STUDI,DC=LOCAL" `
           -AccountPassword(Read-Host -AsSecureString "Mot de passe ?") `
           -ChangePasswordAtLogon $true `
           -Enabled $true


#------

New-aduser -name "Ace" -AccountPassword(Read-Host -AsSecureString "Mot de passe ?") 
