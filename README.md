# PSGitDotfiles

[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/PSGitDotfiles.svg)](https://www.powershellgallery.com/packages/PSGitDotfiles)

A simple Git-based dotfiles approach.

## What is it?

[This approach](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/) is based on using a bare Git repository in your home directory and an alias to make it easy to work with that repository.

## How do I use it?

### Installation

Use PowershellGet to install from PowerShell Gallery.

```powershell
Install-Module -Name PSGitDotfiles
```

### Starting from scratch

```powershell
# The Uri can be ommitted if you want to add the remote later (or don't plan to use one)
Initialize-GitDotfiles -Uri 'https://github.com/username/dotfiles.git'

# You can use "dot" instead of "Invoke-GitDotfiles"
Invoke-GitDotfiles add .gitconfig
Invoke-GitDotfiles add .atom/config.cson

Invoke-GitDotfiles commit -m 'adding first files'
Invoke-GitDotfiles push -u origin master
```

### Copying to another computer

```powershell
Install-GitDotfiles -Uri 'https://github.com/username/dotfiles.git'
```

### Removing the repo

```powershell
Uninstall-GitDotfiles
```
