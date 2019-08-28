<# Profile with abbrevations for Git commands #>

# Remove aliases before creating functions with these names to prevent clashing
Remove-Item Alias:"gs" -Force
Remove-Item Alias:"gl" -Force
Remove-Item Alias:"gp" -Force

# Create functions to wrap over commands
function gs { git status }
function gl { git log }
function gp { git push }