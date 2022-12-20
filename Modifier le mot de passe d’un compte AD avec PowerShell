#Réinitialiser un mot de passe d’un utilisateur Active Directory :

Set-ADAccountPassword -Identity j.nanas -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "GhYjKb!M05n" -Force)

#Simplement modifier un mot de passe et avoir un prompt qui vous demande de le saisir deux fois :

Set-ADAccountPassword -Identity j.nanas -Reset

#Demander à l’utilisateur de changer son mot de passe :

Set-ADUser -Identity j.nanas -ChangePasswordAtLogon $true
