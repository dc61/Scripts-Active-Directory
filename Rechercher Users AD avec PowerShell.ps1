Import-Module ActiveDirectory

---

Get-ADUser -Filter {SamAccountName -like '*'}  

#Remplacer SamaccountName par Name, Surname...

------

Get-localuser -name '*'


