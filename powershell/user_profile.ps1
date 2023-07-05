Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\daiky_xendo.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Prompt
Import-Module posh-git

# Alias
Set-Alias e nvim
Set-Alias vim nvim
Set-Alias c cls

function g {
    git clone $args
}

function .. {
    cd ..
}

function ... {
    cd ..\..
}

function n {
    npm start
}

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

cls
