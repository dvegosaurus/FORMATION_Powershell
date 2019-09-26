$users = import-csv "C:\Git\Democode\Mod08\Labfiles\users.csv"

foreach ($user in $users)
{
    $mail = "$($user.userID)@adatum.com"
    $username = "$($user.First) $($user.last)"
    Write-Progress -activity $username -status $mail

    $param = @{
       GivenName         =  $user.first
       Surname           =  $user.Last    
       DisplayName       =  $username
       SamAccountName    =  $user.userID
       UserPrincipalName =  $username
       Name              =  $username
       Path              =  "OU=$($user.Department),DC=Adatum,DC=COM"
       Department        =  $user.Department
    }
    new-aduser @param
}
