function Get-RemoteLogicalDrive
{
    <#
.Synopsis
   Fais des trucs
.DESCRIPTION
   Fais des trucs longs.
.EXAMPLE
   Fo fer comme ssa é pui apré sa march
.EXAMPLE
   ou bien tu peu fer come sa ossi
.INPUTS
   Les trucs a mettre
.OUTPUTS
   Si tu l'a mise faut la sortir
.NOTES
   3 et demi sur 100 ?
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
.PARAMETER computername
   eul computer biloute
#>
    [cmdletbinding()]
    param(
        [parameter(mandatory=$true,position=0,ValueFromPipeline)]
        [string]$computername,
        [Switch]$AllDrive,
        [Switch]$Credential
    )  
    process 
    {
        write-verbose "working on  $computername"
        if (!(Test-Connection $computername -Quiet -count 1)){
        write-error "je peux pas pinguer $computername"
    }
        else
        {
        write-verbose "ping OK for  $computername"
        if ($alldrive){get-ciminstance Win32_LogicalDisk -computername $computername}
        else {get-ciminstance Win32_LogicalDisk -computername $computername -Filter "drivetype=3"}
        }
    } # process
}

#Get-help Get-remoteLogicalDrive -ShowWindow



