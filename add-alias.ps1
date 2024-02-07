param (
    [string]$aliasName
)

# Validate the aliasName parameter
if (-not $aliasName) {
    Write-Host "Please provide an alias name."
    exit 1
}

# Get the current working directory
$currentDirectory = Get-Location -PSProvider FileSystem
$directoryPath = $currentDirectory.Path

# Create the script file in C:\Program Files\scripts
$scriptContent = @"
# Set the path to the desired location
`$directoryPath = "$directoryPath"

# Check if the directory exists
if (Test-Path `$directoryPath -PathType Container) {
    # Change the current working directory to the specified path
    Set-Location -Path `$directoryPath

    # Open Visual Studio Code in the current directory
    code .

    Write-Host "Visual Studio Code opened in `$(`$directoryPath)"
} else {
    Write-Host "Directory not found: `$(`$directoryPath)"
}
"@

$scriptFilePath = "C:\Program Files\scripts\$aliasName.ps1"
$scriptFilePath = $scriptFilePath -replace '\\','\\'  # Escape backslashes for regex

# Check if the script file already exists
if (Test-Path $scriptFilePath) {
    Write-Host "Script file '$aliasName.ps1' already exists in C:\Program Files\scripts."
    exit 1
}

# Create the script file
$scriptContent | Out-File -FilePath $scriptFilePath -Encoding utf8

Write-Host "Script file '$aliasName.ps1' created in C:\Program Files\scripts."

# Open Visual Studio Code in the current directory
code .

Write-Host "Visual Studio Code opened in $directoryPath"
