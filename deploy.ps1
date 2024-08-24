# Must be ran as administator
# There's an interesting group policy to change that, but thats for later
# TODO: Since propably running as administrator, use runas or similar for the correct user
git submodule init
git submodule update --remote
# New-Item -Path ([System.Environment]::GetFolderPath('MyDocuments') + "\WindowsPowerShell\profile.ps1") -ItemType SymbolicLink -Value ($HOME + "\.config\dotfiles\ps\profile.ps1")
# If documents folder is not in default locations, powershell can't find the profile
# The $HOME-variable does not change from original user in elevated promt
New-Item -Path ($PSHOME + "\Profile.ps1") -ItemType SymbolicLink -Value ($HOME + "\.config\dotfiles\ps\profile.ps1")
# Vim
New-Item -Path ($HOME + "\.vim") -ItemType SymbolicLink -Value ($HOME + "\.config\dotfiles\.vim")
New-Item -Path ($HOME + "\.vimrc") -ItemType SymbolicLink -Value ($HOME + "\.config\dotfiles\.vimrc")