---
layout: post
title: UAV (drone) Mapping
---

# Fairbanks Parking Lot UAV Mapping

_Saturday, May 22nd 2014_

** Quadcopter Fun **

Unmanned Aerial Vehicle (UAV) mapping  has been a work
topic for the last few years.  Especially with the
growth of [ACUASI](http://acuasi.alaska.edu/) at UAF
and the recently launch of the [EPSCoR Modern Blanket
Toss project](http://www.alaska.edu/epscor/) -
training highschool students how to fly UAVs and
collect data.

I've recently let a few of my spare cycles be
absorbed by a fascination with UAVs and flying them.
The Modern Blanket Toss/Upward Bound folks let me
borrow one of their training copters for the students.

[Hubsan X4](http://www.amazon.com/dp/B00ILYJERW?psc=1)
with a 2MP pin hole camera - $70:
![hubsan](/images/epscor-hubsan-x4-s.jpg)

I of course had to Amazon up a [crash pack](http://www.amazon.com/Hubsan-H107L-Quadcopter-Crash-Pack/dp/B00FZ1P3LK/ref=sr_1_4?s=toys-and-games&ie=UTF8&qid=1401039809&sr=1-4&keywords=hubsan+x4)
to replace the parts I've broken while borrowing the
copter while learning to fly ... which is
the whole point.  Learn how to fly a quad copter
that costs $60 instead of $1600 is much safer and
a pile of fun.

I so enjoyed borrowing the X4 that I've ordered up two
of my own (without the cameras).

**Trail maps**

Then last week [GINA](http://gina.alaska.edu) was
contacted for a shapefile of the UAF campus trails.
In the process of digging around the community to find
the data the email thread expanded out to loop in some
of the [Fairbanks Drone User Group](http://www.meetup.com/FBXDUG/).
The group felt that if we couldn't find the trails as
shapefiles we could go map the trails using a UAV.  We
decided to meet up at the IARC/WRRB parking lot and play
with a UAV.

This saturday afternoon we gathered together to give a
shot at doing some UAV flying.  The wind turned out to be
a bit too much to allow unleashing the UAV for real
mapping efforts so we launched and flew the IARC-WRRB
parking lot.

Logan preparing launch:
![launch](/images/uav-parking_lot-gopro-parking_lot_launch-s.jpg)

Shot once it was launched:
![good gopro shot](/images/uav-parking_lot-gopro_good-s.jpg)

### Processing

The UAV owner and pilot Logan , Logan, was nice enough to
provide me a copy of the imagery collected. I tossed
the imagery into a demo copy of [Agisoft Photoscan](http://www.agisoft.ru/products/photoscan)
to see if I could create a point cloud and mesh out
of the imagery.  

I managed to get a point cloud generated from the frames.  Took 5 hours.

This is the first time I've used Agisoft ... and I've not read any of the tutorials/documentation or asked anybody who actually knows how to use this software... and clearly I should probably do that.

That said I did get a point cloud and a made a mesh
and my  initial results were not very impressive:

![sad point cloud](/images/uav-parking_lot-point_cloud-sad-s.jpg)

I poked around a bit and realized the input imagery
from the GoPro clearly was affected by shaking and the
wind as you can see below:

![wiggles in go_pro](/images/uav-parking_lot-gopro-G0010219-s.jpg)

Not wanting to give up, I told AgiSoft to try harder
and spend 8 hours matching pixels (higher quality
target resolution).  This second attempt managed to
upgrade the point cloud and mesh to look like the
WRRB/IARC parking lot:

![better point cloud](/images/uav-parking_lot-high_poor-s.jpg)

Not great but loads of fun and education.

## University of Alaska Fairbanks Trails

Don't worry - In the end a combination of the Fairbank's
Borough and the UAF Facility Services came though with
vectors of the UAF trails for the requesting user.  
I've made those available on GitHub at the following
repos:

* [dayne/uaf-trails](https://github.com/dayne/uaf-trails)
* [dayne/uaf-skarland-trails](https://github.com/dayne/uaf-skarland-trails)
