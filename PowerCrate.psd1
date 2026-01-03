@{
    RootModule        = 'PowerCrate.psm1'
    ModuleVersion     = '0.1.0'
    GUID              = '48f60b45-eedf-5ca9-ad24-2c9563ef8b0c'
    Author            = 'pasta0126'
    CompanyName       = 'More Than Void Company'
    Description       = 'A lightweight PowerShell toolbox for developers and power users.'
    PowerShellVersion = '5.1'

    FunctionsToExport = @('open','sln')
    AliasesToExport   = @()

    PrivateData = @{
        PSData = @{
            Tags = @('powershell','tools','dotnet','developer','cli','utility')
            ProjectUri = 'https://github.com/pasta0126/PowerCrate'
            LicenseUri = 'https://github.com/pasta0126/PowerCrate/blob/main/LICENSE'
        }
    }
}
