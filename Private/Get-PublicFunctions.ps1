function Get-PublicFunctions {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$PublicPath
    )

    $names = @()

    Get-ChildItem -Path $PublicPath -Filter '*.ps1' -File |
    ForEach-Object {
        $content = Get-Content -Path $_.FullName -Raw
        $regexMatches = [regex]::Matches($content, '(?im)^\s*function\s+([a-zA-Z0-9\-_]+)\s*\{')
        foreach ($m in $regexMatches) {
            $names += $m.Groups[1].Value
        }
    }

    $names | Select-Object -Unique
}
