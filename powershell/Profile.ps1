<#  Powershell Profile

    This Powershell profile can be found via $PSHOME in powershell.
    This profile is used for $Profile.AllUsersAllHosts

#>

# Remove aliases before creating functions with these names to prevent clashing
# Can only be removed with the force flag applied
if (Test-Path Alias:gl) {
    Remove-Item Alias:gl -Force
}
if (Test-Path Alias:gc) {
    Remove-Item Alias:gc -Force
}
if (Test-Path Alias:gp) {
    Remove-Item Alias:gp -Force
}


# Only add alias if it does not already exist
# Mainly used to prevent errors when re-running Profile script using the rs function
if (-Not (Test-Path Alias:which)) {
    # Semantically similiar to the which command on linux shells
    New-Alias which get-command
}


<# Create functions to wrap over commands #>
# git abbrevations that takes in all the other arguements
function g { git $args }
function gs { cls; git status $args }
function gs. { cls; git status . }
function gl { git log $args }
function gc { git commit $args }
function gp { git push $args }
function ga { git add $args }
function gd { git diff $args }
function gf { git fetch $args }
function gds { git diff --staged $args }
function gpb { git push origin $args":"$args } # Git push branch, pushes a specific branch to origin without needing to be on that branch

# Abbrevation functions for npm commands
function nodei { node --inspect-brk $args }
function nr { npm run $args }
function nrs { npm run serve }
function nx {
    $arguement = $args[0]
    nodemon -x $arguement
}

<# Misc functions and aliases #>
# Function to go up 1 directory and alias to call the function.
function back-dir { cd .. }
Set-Alias -Name .. -Value back-dir

function et { exit }

# Functions to show network info of the given network name, and the password of that network
function network { netsh wlan show profile name=$args key=clear }
function networkPassword {
    # netsh wlan show profile name=dlink-5F50 key=clear | findstr "Key Content" |
    # $theHash.GetEnumerator() | ? Value -eq mean | % Key
    $network = $args[0]
    write-host("Network selected: ", $network)
    netsh wlan show profile name=$network key=clear | findstr "Key Content";
}

# Docker related shortcuts
Set-Alias -Name d -Value docker
Set-Alias -Name dc -Value docker-compose
function ds { docker ps }
function di { docker image $args }
function dsp { docker system prune -f }

# Abbrevation to start "powershell" in new window
function psh { Invoke-Item $PSHOME\powershell.exe }
# Abbrevation to start "cmd" in new window
function csh { start cmd }

# Runs module installer script in a elevated powershell process, and pause when completed
# Accepts a single arguement for installer script's file path.
function installer { Start-Process -Verb RunAs powershell.exe -Args "-executionpolicy bypass -command Set-Location \`"$PWD\`"; $args; pause" }

# Function to reload all the profiles so that any changes made in Profile.ps1 scripts,
# can be loaded into the current session without creating a new powershell process
function rs {
    @(
        $Profile.AllUsersAllHosts,
        $Profile.AllUsersCurrentHost,
        $Profile.CurrentUserAllHosts,
        $Profile.CurrentUserCurrentHost
    ) | % {
        if(Test-Path $_){
            Write-Verbose("Running $_")
            . $_
        }
    }    
}

# Function to open explorer in given path
function explore {
    if ($args) {
        explorer $args
    } else {
        # Open explorer in current directory if no path given
        explorer .
    }
}
