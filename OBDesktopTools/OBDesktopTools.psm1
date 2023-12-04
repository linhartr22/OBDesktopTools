# PowerShell Script Loader.

# Get Script Files.
$ScriptFiles = @(Get-ChildItem -Path $PSScriptRoot\Scripts\*.ps1 -ErrorAction SilentlyContinue)
if ($ScriptFiles) {
    Write-Verbose -Message "Found script modules at $PSScriptRoot\Scripts"
}
else {
    Write-Error -Message "No script modules were found at $PSScriptRoot\Scripts"
    return $false
}

# Dot Source Script Files.
foreach($file in @($ScriptFiles)) {
    try {
        . $file.fullname
    }
    catch {
        Write-Error -Message "Failed to import function $($file.fullname): $_"
        return $false
    }
}

# Export Functions, Cmdlets and Aliases.
Export-ModuleMember -Function * -Cmdlet * -Alias *
return $true