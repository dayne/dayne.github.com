---
layout: post
title: gdal starter
---

# {{page.title}}

_20 Nov 2010 - Fairbanks (GINA)_

This is a work related ramble.

#### The Problem

I received a pile of GeoTIFFs and MrSid files to showing different processing options available for a data set.  I need to display these various data sets in both overview and full resolution to select users for feedback.  The collection of files is too large to just put on a USB stick and hand out to 30 or 40 people we want the feedback from (74GB of data).

##### Options

* Convert the whole lot of them to KMZ files and offer those out.  Probably will do this no matter what happens.
* Shove each into a separate layer of a WMS - Good idea!
* WMS -> [Shiv](http://github.com/gina-alaska/shiv) -> Google Maps interface - Great idea!

...

##### Solution(s)

MrSID is awkward to work with - GeoTIFF mmkay thx

{% highlight bash %}
for I in *.sid; do
  echo $I
  gdal_translate -co compress=DEFLATE -co tiled=YES $I $I.tif
done
{% endhighlight %}

GeoTIFF optimizations.  Main goals: google projection, internal pyramid overviews built.  But first a just get this AlaskaAlbers (yay for that at least) GeoTIFFS into a WMS.


Shove into the 900913 projection to avoid re-projection on the fly over head for the target clients (google maps/google earth).  Just so it is clear, my epsg code file (share/proj/epsg) has the following for the [900913 projection](http://spatialreference.org/ref/sr-org/google-projection/) :

    <900913> +proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@@@null +wktext no_defs <>@

```
  blamo.rb */*/*.tif
```

Hey, what is blamo?  Silly ruby script of course to simply things:

{% highlight ruby %}
1.!/usr/bin/env ruby
ARGV.each do |source|
  tname = "#{File.basename(source, '.tif')}_gm.tif"
  target = File.join(File.dirname(source), tname)
  if File.exists? target
    puts "file exists already: #{target} ... skipping"
    next
  end
  raise "#{source} does not exist" unless File.exists?(source)  
  cmd = "gdalwarp --config GDAL_CACHEMAX 2000 -wm 1000 "       +
        "  -t_srs EPSG:900913 -co compress=LZW -co tiled=YES " +
        "  -rb #{source}  #{target}"
  puts cmd
  system(cmd)
end
{% endhighlight %}

**what did I do wrong there?**  I forgot to set the nodata values.  The gdalwarp command should have included: @-dstnodata '0 0 0'@

Now each of those need overviews added to them so interacting with all of them at once won't annihilate my computer.  I'm about to cheat and use a secret tool made by [spruceboy](https://github.com/spruceboy) that he hasn't published called @add\_overviews.rb@.  At the core is gdaladdo with the powers of 2 math automatically done.  Pretty much same as above only applied to *\_gm.tif

### Adding it all to my WMS

I've got my own organization system for WMS layers (part self inspired the rest at spruceboy's direction).  I'll ignore all that and just show you what was required:

{% highlight text %}
MAP
  NAME HISTOGRAM_SAMPLES

  # avoid duplication
  include 'includes/boilerplate_guts.include.map'

  WEB
    METADATA
      include "includes/srsnformats.include.map"
      #more metadata here but I removed it.
      "wms_onlineresource" "http://sorry-secrets-here/map/histogram?"
    END
  END

  include "layers/histogram/cir_adjusted.map"
  include "layers/histogram/rgb_adjusted.map"
  include "layers/histogram/pan_adjusted_greyscale.map"
  include "layers/histogram/pan_adjusted_singleband.map"

  include "layers/histogram/cir_base.map"
  include "layers/histogram/rgb_base.map"
  include "layers/histogram/pan_base_greyscale.map"
  include "layers/histogram/pan_base_singleband.map"
END
{% endhighlight %}

Nice and simple, all the fancy stuff for getting the huge pile of data organized hidden away in the @layers/histogram/*.map@

One of those looks like:

{% highlight text %}
LAYER
  NAME "cir_adjusted"
  TYPE raster
  STATUS on
  OFFSITE 0 0 0

  include "codes/gm.proj.map"

  GROUP "CIR\_ADJUSTED"

  TILEINDEX "/www/wms.soy/apps/mapserver/maps/indexes/cir_adjusted.shp"
END
{% endhighlight %}

Once again, nice and simple.  The magic for the tileindex comes from the @gdaltindex@ command.  Ran that somewhat like:

{% highlight bash %}
  gdaltindex indexes/cir_adjusted.shp /www/wms/apps/data/path/CIR/*_gm.tif
{% endhighlight %}

Amazing magic complete.  I've got a working WMS that I can point [shiv](https://github.com/gina-alaska/shiv) at and that creates the magic Google maps tile interface I need to produce a google maps layer.  Details of that setup another day.
