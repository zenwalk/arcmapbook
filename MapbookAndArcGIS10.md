#summary what is the future of DS Mapbook?
#labels Featured

> _I was just curious what plans, if any, you know of for DS Mapbook for ArcGIS 10?  We use it a lot and wonder whether it will be a going concern._

> _Thanks for any info and the effort you've put into it._

ArcGIS 10 has it's own officially supported Mapbook feature set called [Data Driven Pages](http://blogs.esri.com/Dev/blogs/arcgisdesktop/archive/2010/01/22/Data-Driven-Pages.aspx), so this is the best place to focus efforts; see [Building map books with ArcGIS](http://help.arcgis.com/en/arcgisdesktop/10.0/help/index.html#//00s90000002s000000.htm).

The process of [migrating from mapbook to data driven pages](http://blogs.esri.com/Dev/blogs/arcgisdesktop/archive/2010/12/29/Migrating-DSMapBooks-to-Data-Driven-Pages.aspx) is described as straightforward, though not automatic.

DS Mapbook **does** work in ArcGIS 10 but very unlikely beyond that. It requires installing VBA support for v10 and then installing mapbook. Installing VBA support is a multi-step process:

  * Install ArcGIS Desktop
  * Install ArcGIS VBA Resources
  * Obtain a license for VBA (from ESRI customer service)

See [Arcgis desktop and VBA](http://www.google.com/url?sa=D&q=http://blogs.esri.com/dev/blogs/arcgisdesktop/archive/2009/10/28/arcgis-desktop-and-vba_3f00_.aspx) and [Installing and licensing VBA at ArcGIS 10](http://www.google.com/url?sa=D&q=http://help.arcgis.com/en/sdk/10.0/vba_desktop/conceptualhelp/index.html%23//000100000130000000).

After this installing Mapbook consists of:

  1. Install Mapbook the usual way (run `_install.bat`)
  1. Run `...ArcGIS\Desktop10.0\Bin\` **Categories.exe**
  1. Scroll down to and select **ESRI Mx Extensions**
    1. click **Add Object** browse to and select `DSMapBookUIPrj.dll` (from where you unpacked the Mapbook package)
    1. uncheck all, and then click on just **DSMapBookExt**, click OK.
  1. While still in the _Component Category Manager_, scroll up to and select **ESRI Contents Views**
    1. Click **Add Object**, again browse for `DSMapBookUIPrj.dll`
    1. Uncheck all classes, click on just **DSMapBookTab**, click OK

This will add a button to the Table of Contents. The button will not show an icon but it works regardless.

_Detailed v10 install recipe courtesy of [Khaled Hussein](http://forums.arcgis.com/threads/8253-Arc-GIS-10-and-Map-Book-DS?p=196333&viewfull=1#post196333)_


---


There are contrasting views on whether data driven pages do in fact subsume all of the mapbook functionality, particularly in the ease of use category. What is very clear though is that the potential of series maps in v10+ using python is much bigger and wider than it ever was with VBA.

[According to Kim Ollivier](http://forums.arcgis.com/threads/9217-what-happeneded-to-DS-Map-Book-s-quot-Export-Map-Series-to-PDF-quot) there aren't any mapbook features missing, back end function or feature wise, in v10's Data Driven Pages at the Arcview license level, however those features are scattered throughout. John Sobetzer points out you'll want to make sure the DDP Toolbar is turned on for easy page-to-page navigation as there is no longer a Mapbook tab in the Table Of Contents). [John also notes](http://forums.arcgis.com/threads/8253-Arc-GIS-10-and-Map-Book-DS?p=25220&viewfull=1#post25220) that some features, like dynamic text, are a lot more work than previous.

Old mapbooks will have to be recreated. For important mapbooks you may need to keep an old version of Arcmap around as at least one person has [not been able to open the old mxd's](http://forums.arcgis.com/threads/7126-existing-projects-using-DSmapbook-open-in-ArcGIS10-Or-recreate) at all in v10 (The free [VMware Converter](http://www.vmware.com/products/converter/) and [VMware Player](http://www.vmware.com/products/player/) are very useful for this).

I'm sure there's more, this is just a thumbnail sketch.  Basically, DDP has a much bigger potential than mapbook but it will take awhile before the community puts together enough 3rd party scripts/add-ons to surpass mapbook in all areas. I have confidence this **will** happen, but it's going to take time.

It will happen faster if someone collects the significant user DDP scripts into one place and integrates them into a package, along with docs, source code control and so on like I did here with Arcmapbbok. That project won't be spearheaded by me this time, though I'll be happy to play a supporting role. :-)

cheers,

matt