$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse -ErrorAction SilentlyContinue )
foreach ($function in $Public) {
    . $function
}
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )
foreach ($function in $Private) {
    . $function
}

Export-ModuleMember -Function $Public.Basename