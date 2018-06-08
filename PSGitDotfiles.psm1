Function Invoke-GitDotfiles {
  <#
  .SYNOPSIS
  Invokes a git command in your dotfiles repository.

  .DESCRIPTION
  Invokes a git command in the dotfiles repo stored in $env:USERPROFILE/.dotfiles/, using
  $env:USERPROFILE as the working tree. All arguments are treated as if they were passed
  to the git command directly.

  .EXAMPLE
  Invoke-GitDotfiles add .gitconfig

  .EXAMPLE
  Invoke-GitDotfiles commit -m 'managing git config'

  .EXAMPLE
  Invoke-GitDotfiles push
  #>
  & git --git-dir `"$env:USERPROFILE/.dotfiles/`" --work-tree=`"$env:USERPROFILE`" $args
}

Function Initialize-GitDotfiles {
  <#
  .SYNOPSIS
  Initializes a new git dotfies repository.

  .DESCRIPTION
  Initializes a new git dotfiles repository as a bare repo in $env:USERPROFILE/.dotfiles/.
  The $env:USERPROFILE will be used as the working tree. Untracked files will not be shown
  by the status command since most of your home directory won't be managed.

  .PARAMETER Uri
  URI to the remote you'll use as the origin. This adds the remote but does not push/pull
  or set an upstream.

  .EXAMPLE
  Initialize-GitDotfiles

  .EXAMPLE
  Initialize-GitDotfiles -Uri https://github.com/ajoberstar/PSGitDotfiles.git
  #>
  [CmdletBinding()]
  Param(
    [string] $Uri
  )
  & git init --bare "$env:USERPROFILE/.dotfiles/"
  Invoke-GitDotfiles config --local status.showuntrackedfiles no
  Invoke-GitDotfiles remote add origin "$Uri"
}

Function Install-GitDotfiles {
  <#
  .SYNOPSIS
  Installs a new git dotfies repository from a remote.

  .DESCRIPTION
  Installs a new git dotfiles repository as a bare repo in $env:USERPROFILE/.dotfiles/.
  The $env:USERPROFILE will be used as the working tree. Untracked files will not be shown
  by the status command since most of your home directory won't be managed.

  The repo will be cloned from the provided URI.

  .PARAMETER Uri
  URI to the remote to clone from.

  .EXAMPLE
  Install-GitDotfiles -Uri https://github.com/ajoberstar/PSGitDotfiles.git
  #>
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory = $True)]
    [string] $Uri
  )
  & git clone --bare "$Uri" "$env:USERPROFILE/.dotfiles/"
  Invoke-GitDotfiles config --local status.showuntrackedfiles no
  Invoke-GitDotfiles checkout --force master
}

Function Uninstall-GitDotfiles {
  <#
  .SYNOPSIS
  Delete the git dotfiles repository.

  .DESCRIPTION
  Delete the git dotfiles repository in $env:USERPROFILE/.dotfiles/.

  .EXAMPLE
  Uninstall-GitDotfiles
  #>
  [CmdletBinding()]
  Param()

  Remove-Item -Path "$env:USERPROFILE/.dotfiles/" -Recurse -Force
}

New-Alias -Name dot -Value Invoke-GitDotfiles
