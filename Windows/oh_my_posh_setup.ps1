# Check if Oh My Posh is already installed
if (-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    # Install Oh My Posh using winget
    winget install JanDeDobbeleer.OhMyPosh -s winget
    Write-Host "Oh My Posh installed successfully."
    # URL of the JSON file
    oh-my-posh font install --user Monofur NF
    oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/williamalvarezdev/personal-config/main/Windows/oh_my_posh/config.json' | Invoke-Expression
    # Get the current username
    $currentUsername = $env:USERNAME

    # Define the URLs for the current and desired settings files
    $currentSettingsURL = "https://raw.githubusercontent.com/williamalvarezdev/personal-config/main/Windows/settings.json"
    $desiredSettingsPath = "C:\Users\$currentUsername\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

    # Download the desired settings file
    Invoke-WebRequest -Uri $currentSettingsURL -OutFile "C:\Users\$currentUsername\Downloads\settings.json"

    # Check if the download was successful
    if (Test-Path "C:\Users\$currentUsername\Downloads\settings.json") {
        # Replace the current settings file with the desired one
        Move-Item -Path "C:\Users\$currentUsername\Downloads\settings.json" -Destination $desiredSettingsPath -Force

        Write-Host "Settings updated successfully!"
    } else {
        Write-Host "Failed to download the settings file. Please check the URL and try again."
    }

} else {
    Write-Host "Oh My Posh is already installed."
}
