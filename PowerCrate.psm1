$PublicPath  = Join-Path $PSScriptRoot 'Public'
$PrivatePath = Join-Path $PSScriptRoot 'Private'

Get-ChildItem -Path $PrivatePath -Filter '*.ps1' -File -ErrorAction SilentlyContinue |
    Sort-Object Name |
    ForEach-Object { . $_.FullName }

Get-ChildItem -Path $PublicPath -Filter '*.ps1' -File -ErrorAction SilentlyContinue |
    Sort-Object Name |
    ForEach-Object { . $_.FullName }

$PublicFunctions = @()
if (Get-Command -Name Get-PublicFunctions -ErrorAction SilentlyContinue) {
    $PublicFunctions = Get-PublicFunctions -PublicPath $PublicPath
}

if (-not $PublicFunctions -or $PublicFunctions.Count -eq 0) {
    $PublicFunctions = (Get-ChildItem -Path $PublicPath -Filter '*.ps1' -File | ForEach-Object { $_.BaseName })
}

Export-ModuleMember -Function $PublicFunctions
