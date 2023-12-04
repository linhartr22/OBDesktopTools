# OnBase Desktop Tools
This repo contains OnBase Desktop Administration Tools PowerShell module. It exports the following functions:
* Set-OB_JumpListItems.ps1

## Architecture
The contents of this repo are stored in a child folder, in one of the paths in $env:PSModulePath. This facilitates using the Import-Module command to dot source the script modules and export their functions.
The Import-Module command and the module's functions can be executed interactively from a PowerShell terminal. Most PowerShell modules will find use in other scripts.

## How to Refresh this repo's Shared Code Library Folder
When there is a newer version of this repo use the following PowerShell to refresh the PowerShell Modules folder.
```
$Path=Join-Path -Path ([Environment]::GetFolderPath("MyDocuments")) -ChildPath 'PowerShell\Modules'
$Repo='OBDesktopTools'
$RepoPath=Join-Path -Path $Path -ChildPath $Repo
Remove-Item -Path $RepoPath -Recurse -Force -Confirm:$false
git clone "https://git.oit.pdx.edu/scm/ob/$Repo.git" $RepoPath
Remove-Item -Path (Join-Path -Path $RepoPath -ChildPath '.git*') -Recurse -Force -Confirm:$false
Get-ChildItem $RepoPath
Import-Module -Name $Repo -Force -Verbose
```
