$users = import-csv "C:\Git\Democode\Mod08\Labfiles\users.csv"
$ADpath = "OU=IT,DC=Adatum,DC=COM"

foreach ($user in $users)
{
    $mail = "$(user.userID)@adatum.com"
    $username = "$($user.First) $($user.last)"
    Write-Progress -activity $username -status $mail

    $splat = @{
       GivenName         =  $user.First
       Surname           =  $user.Last    
       DisplayName       = $username
       SamAccountName    = $username
       UserPrincipalName = $username
       Name              = $username
       Path              = $ADpath
       Department        = $user.Department
    }
    new-aduser @splat
}