---
layout: post
title: installing qgis on fedora from git
---

# {{page.title}}

_21 July 2011 - Fairbanks_

*follow up post for [Fedora 15](/2011/08/14/qgis_on_fedora_15.html) here*

#### Phase one: dependencies

This is a bit unorganized yum install collection because as I found missing deps I just kept adding to my notes:

{% highlight bash %}
yum install cmake flex bison qt4-devel sqlite3-devel qwt-devel \
  git proj-devel geos-devel gdal-devel \
  graphviz graphviz-devel doxygen grass-devel grass \
  compat-expat1 expat-devel gsl-devel PyQt4-devel \
  qt-webkit qt-webkit-devel PyQwt PyQwt-devel
{% endhighlight %}

I had: proj, geos, gdal/ogr from the GINA magic 'mapping tools' sauce.  I'll document how to get that setup on Fedora in another post.

#### Phase two: clone repo

{% highlight bash %}
mkdir ~/gits
cd ~/gits
git clone https://github.com/qgis/Quantum-GIS.git
cd Quantum-GIS
mkdir build-master
cd build-master
{% endhighlight %}

#### Phase four: Compile and install

Now you begin the fun process of ccmake:

{% highlight bash %}
ccmake ..
{% endhighlight %}

You keep pressing 'c', if you get an error, fix it.  Press 'c' until you don't get errors any more, then you press 'g' to generate the makefiles.  

Before I pressed 'g'enerate I set my `CMAKE_INSTALL_PREFIX` to be '/home/dbroders/apps' because that is where I wanted my qgis to show up (instead of /usr/local)

{% highlight bash %}
make
mkdir ~/apps
make install
{% endhighlight %}

Then to use it (since I installed mine in $HOME/apps) I created my setup.sh:

{% highlight bash %}
QGIS_HOME=/home/dbroders/apps/
LD_LIBRARY_PATH=${QGIS_HOME}/lib:${LD_LIBRARY_PATH}
PATH=${QGIS_HOME}/bin:$PATH
LC_NUMERIC=C
export  LD_LIBRARY_PATH PATH LC_NUMERIC QGIS_HOME
{% endhighlight %}

To wrap up I had that setup.sh automatically run on login by tossing the following at the end of my ~/.bashrc

{% highlight bash %}
. ~/apps/setup.sh
{% endhighlight %}

Life is good, got myself some fancy new qqis fresh from github.
