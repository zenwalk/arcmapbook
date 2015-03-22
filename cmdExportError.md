## Symptom ##
> Export of the series will be ok for a few maps but crashes with a message of the form `DSMapBookUIPrj Cmd Export - Click - 461 - File Creation error` or perhaps `cmdExport_Click - Object variable or With block variable not set`.

## Probable cause ##
Existence of a file with the same name or an unsupported character in the map page/tile name.

  * Make sure you are exporting the files to a new directory that doesn't already have any files.
  * ensure you don't have any pages with the same name. Export will create files based on the name of page, so if you have two of those with the same name then it won't be able to create the second one.
  * ensure page names do not contain illegal file system characters: `<>:"/\|?*`


#### Sources ####
  * [DS MapBook - Export and automation error](http://forums.esri.com/Thread.asp?c=93&f=989&t=211395#928486), Apr 28, 2010, Larry Young
  * [Re: DS MapBook - New Version ](http://forums.esri.com/Thread.asp?c=93&f=989&t=211395#835027), Dec 15 2009, Dolph Scott