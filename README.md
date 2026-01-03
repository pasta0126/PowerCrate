# PowerCrate

PowerCrate is a lightweight PowerShell toolbox for developers and power users.

It provides practical, no-nonsense commands to speed up everyday development and system tasks directly from the terminal.

Designed to grow over time, PowerCrate focuses on small, composable utilities that “just work” for common development and system workflows.

## Features

- `sln`
  Open the first (or interactively selected) Visual Studio solution (`.sln`) found under the current directory.

- `open`
  Open a file or directory using the operating system’s default file explorer (`open .`, `open ..`, etc.).

## Installation

### Using PSResourceGet (recommended)

```powershell
Install-PSResource PowerCrate -Repository PSGallery -Scope CurrentUser
```

### Using PowerShellGet (legacy)

```powershell
Install-Module PowerCrate -Scope CurrentUser
```

After installation, import the module:

```powershell
Import-Module PowerCrate
```

## Usage

### Open the current directory

```powershell
open .
```

### Open the parent directory

```powershell
open ..
```

### Open a Visual Studio solution in the current folder

```powershell
sln
```

### Open a specific solution by name

```powershell
sln MyProject
```

If multiple solutions are found, PowerCrate will prompt you to select one interactively.
