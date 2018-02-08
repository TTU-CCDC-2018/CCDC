Import-Module ActiveDirectory
Import-Csv "C:\Users\Vitaly\Desktop\users.csv" | ForEach-Object {
 
 $_."First Name" = $_."First Name".ToLower()
 $_."Last name"  = $_."Last name".ToLower()
 
 $login = ""
 If ($_."Last name".length -ge 7)
 {
    $login = $_."First Name"[0] + $_."Last name".Substring(0,7)
 }
 Else
 {
    $login = $_."First Name"[0] + $_."Last name"
    $zeros = 8 - $login.length - 1

    If ($zeros -gt 0)
    {
        $login = $login + "0" * $zeros
        
    }
    $login = $login + "1"
 }
 $userPrincipalName = $login + "@team.local"


New-ADUser -Name $_."First name" `
 -Path "OU=TeamOU,DC=TeamDomain,DC=Local" `
 -SamAccountName $login `
 -UserPrincipalName $userPrincipalName `
 -AccountPassword (ConvertTo-SecureString "p@$$w0rD" -AsPlainText -Force) `
 -ChangePasswordAtLogon $true  `
 -Enabled $true
Add-ADGroupMember "Domain Admins" $login;

Write-Output $userPrincinpal

}