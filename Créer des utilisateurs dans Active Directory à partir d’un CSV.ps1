$CSVFile = "C:\Scripts\u1.csv"
$CSVData = Import-CSV -Path $CSVFile -Delimiter ";" -Encoding UTF8

Foreach($Utilisateur in $CSVData){

    $UtilisateurPrenom = $Utilisateur.Prenom
    $UtilisateurNom = $Utilisateur.Nom
    $UtilisateurLogin = ($UtilisateurPrenom).Substring(0,1) + "." + $UtilisateurNom
    $UtilisateurEmail = "$UtilisateurLogin@proton.me"
    $UtilisateurMotDePasse = "Root1.Root1."
    $UtilisateurFonction = $Utilisateur.Fonction

    # Vérifier la présence de l'utilisateur dans Active Directory
    if (Get-ADUser -Filter {SamAccountName -eq $UtilisateurLogin})
    {
        Write-Warning "L'identifiant $UtilisateurLogin existe déjà dans l'AD"
    }
    else
    {
        New-ADUser -Name "$UtilisateurNom $UtilisateurPrenom" `
                    -DisplayName "$UtilisateurNom $UtilisateurPrenom" `
                    -GivenName $UtilisateurPrenom `
                    -Surname $UtilisateurNom `
                    -SamAccountName $UtilisateurLogin `
                    -UserPrincipalName "$UtilisateurLogin@studi.local" `
                    -EmailAddress $UtilisateurEmail `
                    -Title $UtilisateurFonction `
                    -Path "OU=i,DC=STUDI,DC=LOCAL" `
                    -AccountPassword(ConvertTo-SecureString $UtilisateurMotDePasse -AsPlainText -Force) `
                    -Enabled $true
                    
                    
        Write-Output "Création de l'utilisateur : $UtilisateurLogin ($UtilisateurNom $UtilisateurPrenom)"
    }
}

#Ce script PowerShell permet de créer des utilisateurs Active Directory à partir d'un fichier CSV contenant les informations des utilisateurs.

#La première ligne spécifie le chemin d'accès et le nom du fichier CSV contenant les utilisateurs avec leurs informations.

#La deuxième ligne utilise la cmdlet "Import-CSV" pour importer les données du fichier CSV. Le paramètre "Delimiter" spécifie le séparateur de champ utilisé dans le fichier CSV. Le paramètre "Encoding" spécifie l'encodage du fichier CSV.

#La boucle "foreach" parcourt chaque ligne de données dans le fichier CSV.

##Les variables sont ensuite affectées avec les données de chaque ligne. La variable "$UtilisateurLogin" est créée à partir de la première lettre du prénom et du nom de famille de l'utilisateur. La variable "$UtilisateurEmail" est créée en utilisant la variable "$UtilisateurLogin" pour former une adresse e-mail. La variable "$UtilisateurMotDePasse" est initialisée avec un mot de passe par défaut.

#La commande "Get-ADUser" est utilisée pour vérifier si l'utilisateur existe déjà dans Active Directory. Si l'utilisateur existe, un message d'avertissement est affiché. Sinon, la cmdlet "New-ADUser" est utilisée pour créer un nouvel utilisateur avec les informations extraites du fichier CSV.

#La commande "-AccountPassword" permet de définir le mot de passe du compte utilisateur. La commande "ConvertTo-SecureString" permet de convertir la chaîne de caractères du mot de passe en un objet sécurisé pour être stocké dans Active Directory.

#Enfin, un message est affiché pour indiquer que l'utilisateur a été créé avec succès.
