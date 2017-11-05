Function Invoke-GitDotfiles {
    & git --git-dir `"$env:USERPROFILE/.dotfiles/`" --work-tree=`"$env:USERPROFILE`" $args
}

Function Initialize-GitDotfiles {
    [CmdletBinding()]
    param()
    & git init --bare $env:HOME/.dotfiles
    Invoke-GitDotfiles config --local status.showuntrackedfiles no
}

New-Alias -Name dot -Value Invoke-GitDotfiles
