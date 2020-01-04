# Powershell Scripts and Modules
This directory holds all my powershell scripts and modules, including my powershell profile script too.  


## Profile
The powershell profile script is Profile.ps1  
Inside contains all the code to modify and set things up in powershell everytime a new session is ran.  


## Modules
- [sudo](./sudo)
    - The sudo module allows powershell users to have access to the `su` and `sudo` functions, which will work similarly if not the same as the `su` and `sudo` commands on linux shells.
    - Includes self install / manual install script for this module
- [remix](./remix)
    - The remix module is a wrapper over the remix-ide Binary installed via npm with some helper functions for using in windows
    - Includes self install / manual install script for this module


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