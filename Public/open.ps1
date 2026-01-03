function open {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Path = "."
    )

    $resolved = Resolve-Path -Path $Path -ErrorAction Stop

    if ($IsWindows) {
        Start-Process "explorer.exe" -ArgumentList $resolved.Path
        return
    }

    if ($IsMacOS) {
        & /usr/bin/open $resolved.Path
        return
    }

    if ($IsLinux) {
        & xdg-open $resolved.Path
        return
    }

    throw "Unsupported OS."
}
