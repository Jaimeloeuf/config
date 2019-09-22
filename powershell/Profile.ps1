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

<# Function for running local Remix-IDE
    Takes in an arguement of either "p" or "c", specifying powershell or cmd to be used for running remix
    If no inputs are given, the default shell, CMD, will be used to run remix
#>
function remix {
    if ($args -eq "p") {
        write-host("Running remix with Powershell")
        start powershell { remix-ide } # Run with Powershell
    } elseif ($args -eq "c") {
        write-host("Running remix with CMD")
        start remix-ide # Run with CMD
    } else {
        write-host("Invalid shell specified to run remix in.")
        write-host("Default shell: CMD will be used to run remix.")
        start remix-ide # Run with CMD
    }
}

# Abbrevation to start "powershell" in new window
function psh { Invoke-Item $PSHOME\powershell.exe }
# Abbrevation to start "cmd" in new window
function csh { start cmd }