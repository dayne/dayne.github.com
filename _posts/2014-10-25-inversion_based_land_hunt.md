---
title: Inversion based land shopping in Fairbanks
layout: default
---

# Land shopping in Fairbanks based on the inversion layer

_Saturday, October 25th 2014_

I've lived in Fairbanks Alaska as my primary location since starting my computer science degree with UAF back in 1996. This coming Winter will be my 18th Fairbanks winter; 8 of which are in a house Julie and I bought in University West.

A neat feature of winter in Fairbanks Alaska is the *inversion layer*.  Fairbanks is in a low elevation area ringed by hills.  This creates the opportunity during winter for a puddle of cold air to collect over Fairbanks.  Fairbanks has very low winds so this puddle of cold air will sit on top of us for weeks at a time.

What is going on here is the a very cold puddle of air sits on parts of Fairbanks.  This means I can drive to work from inside the puddle and as I go up the hill on campus the temperature will increase by up to 10 or 15 degrees.  When it is -25 at home -15 at work feels much more pleasant.

You can see the effect in this picture from the [Alaska DEC](http://dec.alaska.gov/air/anpms/comm/fbks1_pm.htm)

[ ![](/images/dec_image_fairbanks_inversion.jpg) ](http://dec.alaska.gov/air/anpms/comm/fbks1_pm.htm)

There is plenty of research around this problem due to the air quality issues in Fairbanks. A Fairbanks blogger [Richard James - ak-wx](http://ak-wx.blogspot.com/) had a nice article on a specific [extreme inversion](http://ak-wx.blogspot.com/2013/12/extreme-inversion.html) with the following temperature profile example:

![](/images/inversion_layer_profile_example.jpg)

Looking at a few random air profiles based from a sensor at the Fairbanks airport I came up with my own gut rule to play around with:

>  You can get a noticeable improvement in winter temperatures during inversions by being above 30 meters from the airport.

This conclusion is all *not very scientific* at all.  

### Get a DEM

I had Mitch at GINA toss a copy of the Fairbanks Northstar Borough's LiDAR derived bare earth DEM on a drive for me.  This came in the form of a single band GeoTIFF in Alaskan Albers equal area projection.  The single band gave me the heights of areas in feet above sea level.

    airport = 434       # feet
    west_ridget = 602   # WRRB area
    lower_campus = 523  # Julie's office
    inversion = 532     # 30m above airport

![Image of extract](/images/fnsb-dem-extract-area.jpg)

### DEM extract

Extracting just Chena Ridge, University West and Campus from the broader FNSB LiDAR derived bare earth DEM model.

<pre>
gdal_translate -a_nodata 0 \
  -projwin 283783.787568 1669559.68581 293314.224471 1660196.18332 \
  -of GTiff merged_dem.fnsb.2010.tif fnsb.2010.dsm-extract.chena_ridge-uwest-campus
</pre>

A hillshade for giggles:

<pre>
gdaldem hillshade fnsb.2010.dsm-extract.chena_ridge-uwest-campus \
fnsb.2010.dsm-extract-wf-hillshade -z 1.0 -s 1.0 -az 315.0 -alt 45.0 -of GTiff
</pre>

![](/images/fnsb-dem-extract-area-hillshade.jpg)

### Lot for sale test Chena Ridge:

Julie looked up to see what lots are for sale in the Chena Ridge area and found one at 2585 Allen Adale road.

[2585 Allen Adale Rd, Fairbanks, Alaska](https://www.google.com/maps/@64.8329394,-147.9014043,3a,75y,144.66h,73.08t/data=!3m4!1e1!3m2!1sGz9QSdtYZ8a_3JTwY1ZZig!2e0)

<iframe src="https://www.google.com/maps/embed?pb=!1m16!1m10!1m3!1d1696.7062881830598!2d-147.9014042747555!3d64.83293942576836!2m1!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x51325b707e5f96d3%3A0x87711b193f041d4!2s2585+Allen+Adale+Rd%2C+Fairbanks%2C+AK+99709!5e0!3m2!1sen!2sus!4v1414273760913" width="600" height="450" frameborder="0" style="border:0"></iframe>

From the DEM we find it is barely above the *Dayne's simple inversion layer of 540* at a height of 548.  Better than University West but not optimal.

### A mask

This is fun but find a spot and checking each one manually against the DEM is too much work.  I want a 'this is the cold area' mask.  Using QGIS's Raster Calculator against the DEM extract I did a simple calculation of:

    "fnsb.2010.dsm-extract@1" < 540

Creating the following mask effect:

![](/images/chena_ridge_below_inversion_layer_excluded-small.jpg)

### Magic sauce

The next steps let me make this a bit more useable:

* convert raster mask to a vector
* simply the vector from 20K+ polylines to 2k polylines
* convert from EPSG:3338 to EPSG:4326 (google)
* convert shapefile to geojson
* upload to GitHub's Gist system

By creating a EPSG:4326 GeoJSON as a Gist over at [https://gist.github.com/dayne/bf2364c4faa3e17a6499](https://gist.github.com/dayne/bf2364c4faa3e17a6499) I could then have the following embedded map here:

<script src="https://gist.github.com/dayne/bf2364c4faa3e17a6499.js"></script>

### Ground Truthing

Over this coming winter I'll try and remeber to pay attention when the cold starts and see if this whole dance holds up against reality.
