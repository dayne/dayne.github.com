---
layout: post
title: fedora 15 qgis notes
---

# {{page.title}}

_08 August 2011 - Fairbanks_

This is a follow up post to my [Installing QGIS from git on Fedora](/2011/07/21/qgis_from_git.html) with the additional details/changes needed for Fedora 15.

#### dependencies

The old dependencies line almost is good enough but a few tweaks are needed.  The follow up line:

{% highlight bash %}
yum install sqlite-devel # sqlite3-devel gone
{% endhighlight %}

#### compiling

Fedora 15's cmake is a bit different than Fedora 14s.  Changed up from the menu system to fully command line parameter passing for this one.  For some reason the cmake .. was returning `/libgdal.so` instead of `/usr/lib64/libgdal.so` as it should have for yum installed gdal. Fortunately you can easily tell cmake corrected `GDAL_LIBRARY:STRING` variable.

{% highlight bash %}
mkdir ~/qgis # changed up install location

cmake -DCMAKE_INSTALL_PREFIX:PATH=${HOME}/qgis -DGDAL_LIBRARY:STRING=/usr/lib64/libgdal.so ..
cmake -L # check out what it will be doing

make
make install
{% endhighlight %}

##### follow up

Gnome 3 did not please me.  I fixed that with:

@sudo yum groupinstall Xfce@

The libtiff library still does not support BigTIFF format (since libtiff-4 is still labeled beta).  This meant that I have already (3 days) abandoned the yum installed gdal, proj, libtiff, and partners in favor of the [GINA](http://gina.alaska.edu/) recipe.
