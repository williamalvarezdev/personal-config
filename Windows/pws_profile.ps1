oh-my-posh init pwsh --config 'C:\Users\willi\AppData\Local\Programs\oh-my-posh\themes\neko.omp.json' | Invoke-Expression

#Alias

Set-Alias vim nvim
Set-Alias // clear

# PSReadLine
Import-Module PSReadLine

# Fzf
Import-Module PSFzf

# Icons
Import-Module -Name Terminal-Icons
