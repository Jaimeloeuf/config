<# This Powershell profile can be found via $PSHOME in powershell #>
<# Profile with abbrevations for Git commands #>

# Remove aliases before creating functions with these names to prevent clashing
# Can only be removed with the force flag applied
Remove-Item Alias:"gl" -Force
Remove-Item Alias:"gp" -Force

<# Create functions to wrap over commands #>
# git abbrevations that takes in all the other arguements
function g { git $args }
function gs { git status $args }
function gl { git log $args }
function gp { git push $args }

<# Misc functions and aliases #>
# Function to go up 1 directory and alias to call the function.
function back-dir { cd .. }
Set-Alias -Name .. -Value back-dir