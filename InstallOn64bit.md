## Automatic Registration ##
Some (all?) people may experience troubles installing Mapbook on 64 bit Windows XP systems. The fix is to download [register\_component\_category.reg](http://arcmapbook.googlecode.com/svn/trunk/Visual_Basic/register_component_category.reg) from [R95](https://code.google.com/p/arcmapbook/source/detail?r=95) or newer and put in the arcmapbook `Visual_Basic` folder, then run **`_install.bat`**

Note: on 32bit systems this will add 2 registry entries which will not be used. They should be harmless, but if you find differently please file an [Issue](http://code.google.com/p/arcmapbook/issues/list).


## Manual Registration Procedure ##
_in case the above doesn't work_

  1. Run the `Categories.exe` exectutable in you ArcGIS bin directory.
  1. Scroll down to _ESRI Mx Extensions_ and select that category.
  1. Click on the _Add Object ..._ button and browse for `DSMapBookUIPrj.dll`
  1. When the Add Object dialog comes up, uncheck everything and then click on just `DSMapBookExt` and click OK.
  1. While still in the Component Category Manager, scroll up to _ESRI Contents Views_ and select that category.
  1. Click on the _Add Object ..._ button and again browse for `DSMapBookUIPrj.dll`
  1. Uncheck all the classes, then click on just `DSMapBookTab` and click OK


_manual install procedure courtesy of Larry Young in this thread: [DS Mapbook Install on 64-Bit Machine](http://forums.esri.com/Thread.asp?c=93&f=1147&t=183751)_

## Under testing ##
[Domenico Ciaverrella says:](http://forums.esri.com/Thread.asp?c=93&f=1147&t=183751#907647)

Open and Run 32-bit Command Prompt in 64-bit (x64) Windows:

  1. click start
  1. open run dialog and you type `%windir%\SysWoW64\cmd.exe` (or from search box type `%windir%\SysWoW64\cmd.exe`)
  1. Press Enter
  1. you test 32bit console (for instance `echo %programfiles%` you see `program files(x86)`)
  1. move in the folder where you have an install.bat (for instance `cd %programfiles%\yourdll`) and from prompt type `install.bat`
  1. Press Enter

same for uninstall

--