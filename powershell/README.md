# Powershell Scripts and Modules
This directory holds all my powershell scripts and modules, including my powershell profile script too.  


## Profile
The powershell profile script is [Profile.ps1](./Profile.ps1)  
Inside contains all the code to modify and set things up in powershell everytime a new session is ran.  


## Modules
These are powershell scripts that provide additional features, but are optional can can be installed as needed.  
To install them:
1. Download the folder/repo to anywhere.
2. IF USING THE INCLUDED [Profile.ps1](./Profile.ps1)
    - The profile script contains a installer function.
    - Just run `installer .\path\to\the\module\install\script.ps1`
    - This will ask you for permission, and run installation upon accepting.
3. IF NOT USING THE INCLUDED PROFILE SCRIPT
    - Open a new powershell process with admin privileges
    - Run the install script like `.\path\to\the\module\install\script.ps1`
4. Done! Now just restart your powershell process and you can use the modules now.

Modules:
- [sudo](./sudo)
    - The sudo module allows powershell users to have access to the `su` and `sudo` functions, which will work similarly if not the same as the `su` and `sudo` commands on linux shells.
    - Includes self install / manual install script for this module
- [remix](./remix)
    - The remix module is a wrapper over the remix-ide Binary installed via npm with some helper functions for using in windows
    - Includes self install / manual install script for this module


## Misc
- [elevate shell](./elevate%20shell.ps1)
    - Script that can be prepend to any other powershell script to automatically elevate powershell to admin privileged if needed


## Notes (On directory/file-system modes)
The mode we see is just a string representation of a bitfield enum that hides in the Attributes property.  
You can figure out what the individual letters mean by simply showing both side by side:
```powershell
PS> gci|select mode,attributes -u

Mode                Attributes
----                    ----------
d-----                   Directory
d-r---         ReadOnly, Directory
d----l     Directory, ReparsePoint
-a----                     Archive
```

In any case, the full list is:
- d - Directory
- a - Archive
- r - Read-only
- h - Hidden
- s - System
- l - Reparse point, symlink, etc.