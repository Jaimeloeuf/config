<# Profile with abbrevations for Git commands #>

# Remove aliases before creating functions with these names to prevent clashing
# Can only be removed with the force flag applied
Remove-Item Alias:"gl" -Force
Remove-Item Alias:"gp" -Force

# Create functions to wrap over commands
function gs { git status }
function gl { git log }
function gp { git push }