#A partir d'un CSV

$CSVFile = "C:\Scripts\AD_USERS\Utilisateurs.csv"
$CSVData = Import-CSV -Path $CSVFile -Delimiter ";" -Encoding UTF8


Foreach($Utilisateur in $CSVData){

    # Construction du login (SamAccountName)
    $UtilisateurLogin = ($Utilisateur.Prenom).Substring(0,1) + "." + $Utilisateur.Nom

    if (Get-ADUser -Identity $UtilisateurLogin)
    {
       Write-Output "L'identifiant $UtilisateurLogin existe, l'utilisateur va être modifié."
       Set-ADUser -Identity $UtilisateurLogin -Description $Utilisateur.Fonction
    }
}


#----------------------------------------------------------------------------------------------------------------------------------------------------------------

---Modifications en masse via Get-ADUser et Set-ADUser---

#1 – Vider la valeur du champ « Description » pour tous les utilisateurs dont la description contient le mot « Chefs »

Get-ADUser -Filter {Description -like '*Chefs*'} | `
            Set-Aduser -Clear Description        
            
#2 – Mettre à jour le nom d’affichage (DisplayName) de tous les utilisateurs de l’OU « OU=Compta,DC=STUDI,DC=LOCAL » avec une valeur au format « Nom Prénom » en récupérant les valeurs déjà dans l’objet (attributs Surname et GivenName)

Get-ADUser -Filter * -SearchBase "OU=Compta,DC=STUDI,DC=LOCAL" -Properties DisplayName | ForEach-Object{ Set-ADUser $_ -DisplayName ($_.Surname + ' ' + $_.GivenName) }

#3 – Remplacer/écraser la valeur du champ « ProxyAddresses » des utilisateurs de l’OU « OU=Compta,DC=STUDI,DC=LOCAL » pour indiquer l’adresse e-mail principale sous la forme « SMTP:<e-mail> » en récupérant l’adresse e-mail de l’attribut mail

Get-ADUser -Filter * -SearchBase "OU=Compta,DC=STUDI,DC=LOCAL" -Properties mail | ForEach-Object{ Set-ADUser $_ -Replace @{proxyAddresses="SMTP:$($_.mail)"} }

#4 – Attribuer le directeur « bob.alice » comme manager des comptes de l’OU « OU=Compta,DC=STUDI,DC=LOCAL » dont la description ne contient pas le mot « Chefs »

Get-ADUser -Filter {Description -notlike '*Chefs*'} -SearchBase "OU=Personnel,DC=IT-CONNECT,DC=LOCAL" | ForEach-Object{ Set-ADUser $_ -Manager "Bob.alice" }
