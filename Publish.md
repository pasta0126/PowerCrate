# Publishing (for maintainers)

Before publishing a new version to PowerShell Gallery:

1. Update the module version in `PowerCrate.psd1`.

    ```powershell
    ModuleVersion = '0.1.1'
    ```

2. Validate the module manifest.

    ```powershell
    Test-ModuleManifest .\PowerCrate.psd1
    ```

3. Publish using **PSResourceGet*- (recommended).

    ```powershell
    Publish-PSResource -Path . -Repository PSGallery -ApiKey <YOUR_API_KEY>
    ```

4. Verify publication.

    ```powershell
    Find-PSResource PowerCrate -Repository PSGallery
    ```
