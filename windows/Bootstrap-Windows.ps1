if ($null -eq (Get-Command "choco" -ErrorAction SilentlyContinue)) {
	Write-Host "Unable to find chocolatey. Installing now."
	Start-Sleep -s 1
	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

Write-Host "Installing packages..."
Start-Sleep -s 1

$Packages = @(
            'git', 'brave', 'nvim', 'powertoys', 'discord', 'golang', 'vscode', 'flow-launcher', 'microsoft-windows-terminal', 'nodejs', 'python', '7zip', 
            'microsoft-windows-terminal', 'ditto', 'powertoys', 'sharex', 'everything', 'wox', 'postman',
            'steam-client', 'signal', 'whatsapp', 'goggalaxy', 'epicgameslauncher', 
            'msiafterburner', 'mailspring', 'bitwarden', 'microsoft-teams', 'zoom', 'zoomit', 
            'googledrive', 'eartrumpet', 'windirstat', 'sumatrapdf', 'pdfxchangepro', 'qbittorrent', 
            'plex', 'obs-studio', 'gimp', 'krita'
            )

ForEach ($Package in $Packages) {
	choco install $Package -y
}

Write-Host "Installing GlazeWM from winget..."
Start-Sleep -s 1

winget install lars-berger.GlazeWM --silent --accept-source-agreements --accept-package-agreements --disable-interactivity 

$homeFolder = $env:USERPROFILE

$roamingAppData = $env:APPDATA

Copy-Item -Path ".\.glazewm" -Destination $homeFolder -Recurse

$vscodeSettings= "$roamingAppData\Code\User"
$timestamp = Get-Date -Format "yyyyMMddHHmmss"
$keybindingsBackup = "keybindings_$timestamp.json"

Copy-Item -Path "$vscodeSettings\keybindings.json" -Destination "$vscodeSettings\$keybindingsBackup" -Force

Write-Host "VSCode keybindings backup created in $vscodeSettings\$keybindingsBackup."
Start-Sleep -s 1

Copy-Item -Path ".\vscode_settings\keybindings.json" -Destination $vscodeSettings -Force

Write-Host "Done. To set up WSL, run the install script."
