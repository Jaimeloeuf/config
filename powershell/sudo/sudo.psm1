<# Powershell module to add sudo/su functions, that is semantically similiar to unix shells #>

# Boolean value of whether the current powershell process already have admin privileges
# Instead of using a function, this is computed at current powershell process startup since the value will not change throughout the process's lifetime
$is_elevated = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")

# Function mimicing su command semantics of linux shells
# Creates a new powershell process with admin privileges
function su { 
    # Check if current powershell process already have admin privileges
    if (!$is_elevated) {
        # Make current powershell hidden and start a new admin privileged powershell process
        # Both process will be stopped once the admin powershell is closed
        # References:
        # https://stackoverflow.com/a/53338708/13137262
        # https://stackoverflow.com/a/55236108/13137262
        # https://stackoverflow.com/a/31602095/13137262
        Powershell -windowstyle hidden -Command "Start-Process powershell -ArgumentList '-NoExit', '-Command cd ''$pwd''' -Verb runAs"
    } else {
        write-host("Already have admin privileges!")
    }
}

# Function mimicing sudo command semantics of linux shells
# Runs given powershell commands with admin privileges
function sudo { 
    # Check if current powershell process already have admin privileges
    if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
        # Starts a new admin privileged powershell process in the background without any UI
        # Since admin shells starts at 'C:\WINDOWS\system32', the first commands changes cwd to where 'sudo' is ran
        # Run sudo's arguement as commands for the new powershell. Process will stop once it is completed
        start-process Powershell -windowstyle hidden -verb runas -ArgumentList "cd '$pwd'; $args"
    } else {
        write-host("Already have admin privileges, run again without sudo!")
    }
}

# @todo should $is_elevated be exported too?
Export-ModuleMember -Function 'su'
Export-ModuleMember -Function 'sudo'