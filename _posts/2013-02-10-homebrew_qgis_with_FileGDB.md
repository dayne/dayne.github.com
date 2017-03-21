---
layout: post
title: homebrew QGIS with ESRI FileGDB
---

# {{page.title}}

_10th February 2013 - Fairbanks_

### Starting scenario  

homebrew already setup on my handsome OSX laptop.  Got QGIS installed via the Kyngchaos packages but it is all sad and randomly pops now and then.  Want QGIS installed via homebrew.  Ready set go.

### update homebrew

brew update  
brew upgrade

Then go through a few brew installs to fix missing dependencies to achieve updated homebrew setup... it had been a while since I updated my brew.

### source blogs

Ragi Burhum's blog post run down on getting qgis working on homebrew:
[http://blog.burhum.com/post/36080548777/getting-qgis-working-on-homebrew](http://blog.burhum.com/post/36080548777/getting-qgis-working-on-homebrew)

Ragi tackled the FileGDB action too:
[http://blog.burhum.com/post/34851795066/installing-gdal-ogr-with-filegdb-support-on-osx-with](http://blog.burhum.com/post/34851795066/installing-gdal-ogr-with-filegdb-support-on-osx-with)

And this stackexchange helped pull it together:
[http://gis.stackexchange.com/questions/29501/how-to-get-gdb-esri-file-geodatabase-in-qgis-for-mac-osx-10-6](http://gis.stackexchange.com/questions/29501/how-to-get-gdb-esri-file-geodatabase-in-qgis-for-mac-osx-10-6)

### ESRI FileGDB install time

[http://resources.arcgis.com/node/agreement/3193](http://resources.arcgis.com/node/agreement/3193)

_insert rant_

> *Where do you have to login using your ESRI global account to access the download.  Really ESRI? Really?  Stop being dorks and go make your own homebrew, RPM, and .DEB package so people like me don't want to rage at you in our spare happy hacking time.*
>
> *The EULA - they should have a specific EULA for the filegdb support and not contaminate it with ArcGIS online streaming service stuff.  Clean that thing up and really ask themselves why they are restricting access to this thing that lowers the barrier for letting users access their own data.*

Anyway - downloaded the FileGDB_API_1_2-64.zip

```
unzip -d FileGDB_API_1_2-64 FileGDB_API_1_2-64.zip  
mv FileGDB_API_1_2-64 /usr/local/opt  
cd /usr/local/include  
ln -s ../opt/FileGDB_API_1_2-64/FileGDB_API/include/* .  
cd ../lib    
ln -s ../opt/FileGDB_API_1_2-64/FileGDB_API/lib/lib* .  
```

### install the GDAL

Now our GDAL can be built with the magic sauce - but I already had it so remove existing gdal:

```
brew uninstall gdal  
brew install gdal --enable-unsupported
```

### tap science for qgis recipe

```
brew tap homebrew/science  
brew install qgis
```
