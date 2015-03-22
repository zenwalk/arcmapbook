# Introduction #

Installation on Windows Vista and Windows 7 is not yet reliably a straightforward procedure. Some people have no troubles, others a lot. Start with the following, and if you encounter difficulties look at the workarounds further down.

  1. Create a folder on your **`C:\`** drive called "Addons"
  1. Download a release file and extract the contents to **`C:\Addons`** (feel free to rename the default "mini-Mapbook\_for\_9.3\_2010-Nov-30" to something simpler like "Mapbook")
  1. Click on the start menu and do a search for CMD
  1. Right click on the top result cmd.exe and choose "Run As Administrator" (At this point, you may need a system administrator to type in local administrator credentials if your own credentials do not give you administrative access to the computer you are using)
  1. Type in the command: **`C:`** and hit ENTER
  1. Type in the command: **`cd c:\Addons\Mapbook`**
  1. Make sure all ESRI Products are closed
  1. Type in the command: **`INSTALL.bat`**
  1. open ArcMap and see if you see the Mapbook tab in the lower left and the ArcMap Toolbar available to be turned on

_Recipe courtesy of Aaron Hixson (hicksticks2001)_

**Notes**

It is not recommended to copy the files into your your user profile or `C:\Users\%USERNAME%` as other users won't be able to access the Mapbook files. You shouldn't need to turn off UAC (User Access Control) in Windows 7 or Windows Vista if you use the method of running the command prompt as an Administrator.

Running the Install.bat as an administrator from Windows does _not_ work (ie right
click Install.bat then run as administrator). This is the case even when actually logged on as an admin. _See [issue#44](https://code.google.com/p/arcmapbook/issues/detail?id=#44) for background_

# Workarounds #

## Don't run `install.bat` from C: ##

Even with admin rights, the C: volume has some restrictions on what you can and can't do, and from where within the volume those restrictions are applied. Extract the mapbook archive to another drive if possible, or somewhere under your user folder, and run the install from there.

_thanks to Colleen, in comments below_

## Turn off User Account Control ##
Administrator rights are required for this solution.

  * Start >Control Panel >User Accounts > Turn User Account Control on or off
  * Uncheck - Use User Account Control (UAC) to help protect your computer
  * Restart computer

  * Install DS Map Book  (I verified that MapBook appeared in ArcMap.)
  * Go back in and turn UAC back on. (I verified that MapBook appeared in ArcMap.)

http://forums.esri.com/Thread.asp?c=93&f=989&t=64703#799692

_See [issue#16](https://code.google.com/p/arcmapbook/issues/detail?id=#16) for more details._


## Specify absolute path to regedit, regsrvr32 ##
Edit `_install.bat` and put the entire path for regsvr32 and regedit in the file. It
was happy and worked. An updated `_install.bat` is available in [r101](https://code.google.com/p/arcmapbook/source/detail?r=101).

_See [issue#40](https://code.google.com/p/arcmapbook/issues/detail?id=#40) for more details._


## If "Map Series" toolbar not available try: ##

  * Tools > Customize > _Add from file_
  * Browse `path\to\mapbook\Visual_Basic` and select "DSMapBookUIPrj.dll"

"Map Series" should show up in the list of available toolbars.

_See [issue#33](https://code.google.com/p/arcmapbook/issues/detail?id=#33) for more details. Updated .reg files in [r160](https://code.google.com/p/arcmapbook/source/detail?r=160) should fix this._