# Check if Oh My Posh is already installed
if (-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    # Install Oh My Posh using winget
    winget install JanDeDobbeleer.OhMyPosh -s winget
    Write-Host "Oh My Posh installed successfully."
    # URL of the JSON file
    $url = "https://raw.githubusercontent.com/williamalvarezdev/personal-config/main/Windows/oh_my_posh/config.json"

    # Get current user's username
    $user = $env:USERNAME

    # Path to save the JSON file locally
    $localPath = "C:\Users\$user\AppData\Local\oh-my-posh\config.json"

    # Download the JSON file
    Invoke-WebRequest -Uri $url -OutFile $localPath

    # Check if the file has been downloaded successfully
    if (Test-Path $localPath) {
        Write-Host "JSON file downloaded and saved successfully."
    } else {
        Write-Host "Failed to download JSON file."
    }
} else {
    Write-Host "Oh My Posh is already installed."
}
