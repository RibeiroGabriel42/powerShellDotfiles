#Prompt

Import-Module posh-git 
Import-Module oh-my-posh 
Set-poshPrompt Paradox

#Load prompt profile
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-scriptDirectory) 'ribeiro.omp.json' 
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

#Icons
Import-module -Name Terminal-icons

#Posh theme
Set-PoshPrompt bubbles
#PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

#Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'


#Alias

Set-Alias vim nvim 
Set-Alias g git  
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files/Git/usr/bin/tig.exe'
Set-Alias less 'C:\Program Files/Git/usr/bin/less.exe'

#Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
