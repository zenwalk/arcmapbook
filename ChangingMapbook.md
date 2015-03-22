You can not alter the Map Book coding with VBA.  You must have VB6 to make any changes. Once you make the changes, you'll then need to recompile and reinstall Map Book.

## Acquiring Visual Basic 6 ##
This is a little difficult because Microsoft no longer sells or supports VB6, but not impossible.

[Ebay](http://shop.ebay.com/items/__visual-basic-6-professional?_trkparms=65%253A12%257C66%253A2%257C39%253A1%257C72%253A2125&_trksid=p3286.c0.m14&_sop=16&_sc=1) regularily has _Visual Basic 6_ and _Visual Studio 6_ CDs on sale and auction. The buy-now prices range from ~$150-$350 (yes that much!). If the price is significantly less, read the description carefully to make sure the edition offered is not a learning-only version which has compile disabled. It may also be a good idea to make sure it has not been previously registered.

I've read that if you buy a current Visual Studio license from Microsoft you can downgrade to VB6 for a fee.

If you're willing to take the legal and malware risk I'm told it's also possible to locate VB6 on file sharing sites, though be prepared to spend some time swatting popups and backing out of enticing blind alleys. The extracted cd contents will be ~170mb. You'll need a license key; chances are your organization will have one buried somewhere in the archives that is no longer in use.

## Modifying and Activating Changes ##

  1. **Backup current configuration** - make a copy of or zip up `...\path\to\Mapbook\Visual_Basic`
  1. From Visual\_Basic folder **open DSMapBookPrj.vbp** and/or **DSMapBookUIPrj.vbp** in VB6
  1. **Make your changes** (a.k.a. _magic stuff happens here_ )
  1. **Save and compile** -
    1. _(File - Save Project)_
    1. save any edited class files _(File - Save DSMapPage.cls)_
    1. Create the DLL _(File - Make DSMapBookPrj.dll)_ and save over the existing file.
  1. Re-register the DLLs (may not be necessary, close ArcMap first) - _run **INSTALL.BAT**_

You will need to do this every time you make a change to the code.