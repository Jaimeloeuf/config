<# Installation script for sudo module #>

function create_directory {
    # Set target directory
    $target = "$Env:ProgramFiles\WindowsPowerShell\Modules\sudo"

    # Remove directory if it already exists
    if (Test-Path -Path $target) {
        Remove-Item $target -Recurse
    }
    
    # Make directory for module installation
    New-Item -ItemType directory -Path $target
}

function install_sudo {
    create_directory

    # Copy the module file into the directory
    # Get the module file as a relative path to the location of this script (needed for use with Profile's installer function)
    cp $PSScriptRoot\sudo.psm1 $Env:ProgramFiles\WindowsPowerShell\Modules\sudo
}

install_sudo