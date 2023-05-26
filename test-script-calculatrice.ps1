clear-host  
Write-Host "" 
Write-Host "--------------------------------------------------------" 
Write-Host "----------------------CALCULATRICE----------------------"
Write-Host "--------------------------------------------------------" 
Write-Host "" 
Write-Host "Appuie sur ENTRER pour continuer."
#Met le script en pause tant que l'utilisateur n'appuie pas sur une touche.
Read-Host

#Définition des trois variables de calcul.
$valeur1 = "" 
$valeur2 = ""
$operateur = "" 

#Affichage des instructions.
Write-Host "C'est un outil de calcul interactif"
Write-Host "Deux nombres vont vous être demandés pour faire le calcul."
Write-Host "Ainsi que l'opérateur, '+' ou '-'."
Write-Host ""
Write-Host "Appuie sur ENTRER pour continuer."

#Met le script en pause tant que l'utilisateur n'appuie pas sur une touche.
Read-Host

#Demande à l'utilisateur de renseigner la première valeur.
$valeur1 = read-host "Entrez la valeur 1." 


#Demande à l'utilisateur de renseigner la première valeur.
$valeur2 = read-host "Entrez la valeur 2." 

#Demande à l'utilisateur de renseigner la première valeur.
$operateur = read-host "Entrez l'opérateur de calcul." 

Write-Host ""
Write-Host "--------------------------------------------------------"

switch($operateur){
    "+" {
        Write-Host " Addition des valeurs :"
        [int]$valeur1 + [int]$valeur2
    }

    "-"{
        Write-Host " Soustraction des valeurs :"
        [int]$valeur1 - [int]$valeur2
    }

    default{
        Write-Host "opérateur incorrect:"
    }
}

Write-Host "--------------------------------------------------------" 
#Pause script execution and wait for the user to press the Enter key.
Read-Host
