<# Installation script for remix module #>

function create_directory {
    # Set target directory
    $target = "$Env:ProgramFiles\WindowsPowerShell\Modules\remix"

    # Remove directory if it already exists
    if (Test-Path -Path $target) {
        Remove-Item $target -Recurse
    }
    
    # Make directory for module installation
    New-Item -ItemType directory -Path $target
}

function install_remix {
    create_directory

    # Copy the module file into the directory
    cp ./remix.psm1 $Env:ProgramFiles\WindowsPowerShell\Modules\remix
}

install_remix