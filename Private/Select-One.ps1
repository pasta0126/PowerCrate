function Select-One {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [object[]]$Items,

        [Parameter()]
        [scriptblock]$Label = { param($x) $x.ToString() },

        [Parameter()]
        [string]$Prompt = "Select index"
    )

    if (-not $Items -or $Items.Count -eq 0) { return $null }
    if ($Items.Count -eq 1) { return $Items[0] }

    Write-Host "Multiple matches found:" -ForegroundColor Yellow
    for ($i = 0; $i -lt $Items.Count; $i++) {
        Write-Host ("[{0}] {1}" -f $i, (& $Label $Items[$i]))
    }

    $choice = Read-Host $Prompt
    if ($choice -match '^\d+$' -and [int]$choice -ge 0 -and [int]$choice -lt $Items.Count) {
        return $Items[[int]$choice]
    }

    Write-Host "Invalid selection." -ForegroundColor Red
    return $null
}
