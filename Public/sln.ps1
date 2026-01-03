function sln {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Name
    )

    $root = (Get-Location).Path
    $filter = if ([string]::IsNullOrWhiteSpace($Name)) { "*.sln" } else { "*$Name*.sln" }

    $solutions = Get-ChildItem -Path $root -Filter $filter -File -ErrorAction SilentlyContinue |
        Sort-Object FullName

    if (-not $solutions -or $solutions.Count -eq 0) {
        $common = @("src","code","solutions","solution","sln","build","dev","projects")
        foreach ($dir in $common) {
            $p = Join-Path $root $dir
            if (Test-Path $p) {
                $solutions = Get-ChildItem -Path $p -Filter $filter -File -Recurse -ErrorAction SilentlyContinue |
                    Sort-Object FullName
                if ($solutions -and $solutions.Count -gt 0) { break }
            }
        }
    }

    if (-not $solutions -or $solutions.Count -eq 0) {
        $solutions = Get-ChildItem -Path $root -Filter $filter -File -Recurse -ErrorAction SilentlyContinue |
            Sort-Object FullName
    }

    if (-not $solutions -or $solutions.Count -eq 0) {
        Write-Host "No .sln found under $root" -ForegroundColor Red
        return
    }

    $selected = Select-One -Items $solutions -Label { param($x) $x.FullName } -Prompt "Select solution index"
    if ($null -ne $selected) {
        Start-Process $selected.FullName
    }
}
