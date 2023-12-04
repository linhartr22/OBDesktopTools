<#
.NOTES
Author:	Roger D. Linhart
Date: March 6, 2023
TODO:
.SYNOPSIS
This function modifies the HKCU registry to change JumpListItems for the Windows Taskbar.
.DESCRIPTION
Supporting multiple environments results in more servers than the default jump list items allows. This allows all the supported servers to be pinned in the Remote Desktop Connection taskbar jump list, avoiding the need to type cryptic server names. The jump list items can be ordered by the user to make it easier to find the server you need.
.PARAMETER Value
Optional parameter for jump list items. Defaults to 30.
.EXAMPLE
PS> Set-JumpListItems

This example sets jump list items to the default value (30).
.EXAMPLE
Set-JumpListItems -Value 16

This example sets jump list items to 16.
#>

function Set-JumpListItems{
    [CmdletBinding()]
    param(
        [Int32]$Value
    )

    # Size parameter exists and is not null?
    if ($PSBoundParameters.ContainsKey('Value') -and $Value){
        # Yes, continue.
        Write-Verbose ('{0}: Value parameter exists.' -f $MyInvocation.MyCommand.Name)
    }
    else{
        #No, set to default.
        $Value = 30
        Write-Verbose ('{0}: Set Value parameter to default: {1}.' -f $MyInvocation.MyCommand.Name, $Value)
    }

    $RegistryPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
    $Name = 'JumpListItems_Maximum'
    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force | Out-Null
}
