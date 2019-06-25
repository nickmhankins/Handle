# Handle

### What is it?

Handle is a PowerShell wrapper for Handle.exe, a [Sysinternals tool](https://docs.microsoft.com/en-us/sysinternals/) for finding and closing locked files.

### The available commands:

* Install-SysInternals
* Get-LockedFiles
* Close-LockedFiles


## How to use it:

##### Installing SysInternals
Installing the SysInternals tools can be done with the cmdlet Install-SysInternals.  This uses Chocolatey to handle the install, so you will need to have Chocolatey installed on your machine or it won't work

```powershell
Install-SysInternals
```

##### Finding locked files
Finding locked files can be done with the cmdlet Get-LockedFiles

```powershell
Get-LockedFiles -Path 'C:\TestPath'
```

##### Closing locked files
To close these locked files, you can either pipe the results of the previous command into Close-LockedFiles, or just provide it any path

```powershell
Get-LockedFiles -Path 'C:\TestPath' | Close-LockedFiles
```

OR

```powershell
Close-LockedFiles -Path 'C:\TestPath'
```
