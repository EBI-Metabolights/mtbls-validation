# Use the current directory as the source
$CurrentDirectory = Get-Location

# Create "Zipped" folder inside current directory for the archives
$DestinationDirectory = Join-Path $CurrentDirectory "Zipped"

if (-not (Test-Path $DestinationDirectory)) {
    New-Item -ItemType Directory -Path $DestinationDirectory | Out-Null
}

# Zip only top-level folders
Get-ChildItem -Path $CurrentDirectory -Directory | 
Where-Object { $_.Name -ne "Zipped" } |
ForEach-Object {
    $FolderName = $_.Name
    $ZipPath = Join-Path $DestinationDirectory "$FolderName.zip"

    if (Test-Path $ZipPath) {
        Remove-Item $ZipPath -Force
    }

    if (Get-ChildItem $_.FullName) {
        Compress-Archive -Path $_.FullName -DestinationPath $ZipPath -Force
        Write-Host "Zipped: $FolderName -> $ZipPath"
    } else {
        Write-Host "Skipped empty folder: $FolderName"
    }

}

