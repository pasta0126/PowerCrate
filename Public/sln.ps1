function sln {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Name
    )

    $root = (Get-Location).Path
    $filters = if ([string]::IsNullOrWhiteSpace($Name)) { @("*.sln", "*.slnx") } else { @("*$Name*.sln", "*$Name*.slnx") }

    $findSolutions = {
        param(
            [string]$Path,
            [bool]$Recurse
        )

        $searchParams = @{
            Path = $Path
            File = $true
            ErrorAction = 'SilentlyContinue'
        }

        if ($Recurse) { $searchParams.Recurse = $true }

        $results = foreach ($filter in $filters) {
            Get-ChildItem @searchParams -Filter $filter
        }

        $results | Sort-Object FullName -Unique
    }

    $solutions = & $findSolutions $root $false

    if (-not $solutions -or $solutions.Count -eq 0) {
        $common = @("src","code","solutions","solution","sln","build","dev","projects")
        foreach ($dir in $common) {
            $p = Join-Path $root $dir
            if (Test-Path $p) {
                $solutions = & $findSolutions $p $true
                if ($solutions -and $solutions.Count -gt 0) { break }
            }
        }
    }

    if (-not $solutions -or $solutions.Count -eq 0) {
        $solutions = & $findSolutions $root $true
    }

    if (-not $solutions -or $solutions.Count -eq 0) {
        Write-Host "No .sln or .slnx found under $root" -ForegroundColor Red
        return
    }

    $selected = Select-One -Items $solutions -Label { param($x) $x.FullName } -Prompt "Select solution index"
    if ($null -ne $selected) {
        Start-Process $selected.FullName
    }
}
