Import-Module activedirectory
$rfile = import-csv C:\file.csv
foreach ($User in $dfile){
$Uname =$User.Username
$Paswd =$User.Password
$Fname =$User.FirstName
$Ou =$User.OUPath
$description = $User.department
if(Get-ADUser -F {XaccountName -eq $Uname}) {
  Write-Warning "User Already Exists"}
  else{

  New-ADUser`
  -XaccountNasme $Uname`
  -UserPrincipalName "$Uname@test.com"`
  -Name "$Fname $Lname"`
  
  -GiveName $Fname`
  -Surname $Lname`
  -Enabled $true`
  -DisplayName "$Lname, $Fname"`
  -Path $Ou`
  -AccountPassword (convertto-securestring $Paswd -AsPlainText -Force) -ChangePasswordAtLogon $True
   }
   }