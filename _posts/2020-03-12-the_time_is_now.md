---
title: "Time.now? - Time management on Raspberry Pi"
layout: post
---
# {{page.title}}
<p class='#meta'>{{page.date}}</p>  

How does your Raspberry Pi answer the following basic question and what goes wrong when
it can't provide a good answer:
> What is the current time?

### What is time?


### How do we keep track of that in a computer?

RaspberryPis, unlike our laptops and PCs, do not have a "real time clock" (RTC), which is a little low powered counter (with a battery) that keeps track of a count (time) even when the computer is turned off and unplugged.

This means when a Pi boots up it defaults to a specific time and then starts keeping track of time from there.  The default we deal with is usually when either Raspbian was released or when a t3 image was created..  this could be many months prior to when you are booting up. 

The pi defaults to attempting to pull current time from the Internet if it has access... so an internet connected pi will automatically find the current time.  Once it has a current time if you reboot it it will use the last time it had before reboot.. so you only lose a minute or two of time.. and if it still has internet it will update the time again.

All of these time it auto downloads are put into whatever timezone the pi is configured for.  Default Raspbian is in UK (British) timezone.  Default T3 images are in Hawaiian timezone. 

Upon a first boot a Raspberry Pi / T3 pi will ask you to set the timezone.. after that it doesn't ask and you have to manually configure it.

### How does the Pi get time from the Internet?

The default pathway for getting time is to use NTP.  Network Time Protocol.  This is network standard for synchronizing time between computers.  There is an international pool of time servers that partner up and run NTP servers for you to pull time from.  Default NTP server ports are 123.  However, client (your pi) connection to the server requires bidirectional communication.

School firewalls will block non-standard ports and many schools consider NTP non-standard.  So they may block direct NTP server access and/or block the other bidirectional traffic involved in the synchronization process. 

In the school blocking NTP access scenario you two options: Find an NTP server inside the network you are authorized to connect to and manually use it or find an alternative pathway to get time (a hotspot or different non-blocked pathway).
Another option we could consider where a school is blocking NTP but is not blocking web traffic would be to use another time sync protocol & tool that gets time from web servers.


### Wibbly Wobbly Work-arounds

> What would be another time sync protocol and tool that gets time from Internet without using NTP?

Network Time Protocol (NTP) is the leading network time syncronization protocol -- there are many other ways of asking a remote computer 'What time is it?' and setting your local clock to that result.

Crazy bash voodoo `cat < /dev/tcp/time.nist.gov/13` pulls the current time from
the National Institute of Standardsa nd Technology's time server. 

```
sudo install htpdate 
sudo htpdate google.com
```
You could set the Pi up to auto-run htpdate google.com after every reboot and every hour or so using a cronjob or something


### What happens if you don't have Internet readily available?  

This pulls you back to that earlier discussion of a Real Time Clock (RTC).

You can get an RTC for a Pi.  Install the RTC,which comes with a battery, and then you just have to make it aware it has an RTC to use to keep track of time between reboots, set the time either manually or via an Internet connection once, and it will keep track of time like a normal computer (with some small amount of skew over time because no RTC is perfect)>

Another offline time source is using a GPS.  GPS adapters/attachments provide time and you can configure your Pi to pull time from that if it is available.
@Chester we should default to installing htpdate and perhaps consider having it added to rc.local for on-boot (with a delay perhaps) as a back-up pathway but I think leaving the default ntp setup would be recommended as a more general solution.
it doesn't hurt to double synchornize to correct time.. but I'd keep the default ntp pool approach over switching to an htpdate focused approach.

What I really wish you could do is add htpdate as a fallback when the ntpdate pool fails. 

Bonus to htpdate approach is you can do your time sync via HTTPS meaning your time synchronization is fully encrypted and therefor more difficult to do cyber sniffing or attacks against.... but that isn't really a serious risk issue to worry about in t3 context


### Silly Examples of Getting the Date

https://superuser.com/questions/635020/how-to-know-current-time-from-internet-from-command-line-in-linux

Ohh man, there are so many silly ways of getting time from the internet when NTP is blocked.

Here is a fun one that pulls the time from the header of google and slams it into a standard format suitable for use in the same `date -s` format @Jasmine Johnson#8568  used.

`curl -s --head http://google.com | grep ^Date: | sed 's/Date: //g'`

```
$ curl -s --head http://google.com | grep ^Date: | sed 's/Date: //g'
Thu, 12 Mar 2020 20:33:57 GMT
```

See how result is similar to your date format Jasmine?  Well you can use that directly as part of a date set like so:

`date -s "$(curl -s --head http://google.com | grep ^Date: | sed 's/Date: //g')"`

The command line has powerful voodoo!

@hilo90mhz#6621  you might appriciate this silly way of using the `/dev/net` interface: `cat < /dev/tcp/time.nist.gov/13`

Example:
```
cat < /dev/tcp/time.nist.gov/13

58920 20-03-12 20:32:13 50 0 0 941.9 UTC(NIST) *
```
J
Not as easy to directly use the result from that as the curl example but kinda crazy to think about.

### T3 time

https://t3alliance.org/lessons/rpi-time-and-timezones/
T³ Alliance
