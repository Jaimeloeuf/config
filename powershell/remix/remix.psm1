<# Remix-IDE module #>

<# Function for running local Remix-IDE
    Takes in an arguement of either "p" or "c" or "m",
    specifying powershell or cmd or mini CMD to run remix with
    If no inputs are given, the default shell, CMD, will be used to run remix
#>
function remix {
    if ($args -eq "p") {
        write-host("Running remix with Powershell")
        start powershell { remix-ide } # Run with Powershell
    } elseif ($args -eq "c") {
        write-host("Running remix with CMD")
        remix_cmd
    } elseif ($args -eq "m") {
        write-host("Running minified remix in CMD")
        remix_cmd("mini")
    } else {
        write-host("Invalid shell specified to run remix in.")
        write-host("Default shell: CMD will be used to run remix.")
        remix_cmd
    }
}

# Function to run Remix in CMD, with args to control -WindowStyle of the run
function remix_cmd {
    if ($args[0] -eq "mini") {
        start remix-ide -WindowStyle Minimized # Start in minimized window
    } else {
        start remix-ide # Start in new CMD window
    }
}

# Export the main function 'remix', only this will be visible to external callers
Export-ModuleMember -Function 'remix'