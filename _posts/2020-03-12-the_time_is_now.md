---
title: "Time management on Raspberry Pi"
layout: post
---
# {{page.title}}
<p class='#meta'>{{page.date}}</p>  



### What is time?

> _Time is the indefinite continued progress of existence and events that occur in an apparently irreversible succession from the past, through the present, into the future. [*](https://en.wikipedia.org/wiki/Time)_

Here we will focus on something a bit more tangible. How does your Raspberry Pi answer the basic question: 

> **_What time is it?_**


Overly simplified time tracking on a computer:

* Keep a count how many seconds it has been since January 1st 1960.
* Count is kept track of as a single number that ticks up every second.
* A timesource tells computer what the current count is.
  * You can be the time source by manually configuring time.
  * The computer can ask another computer for current time (network / cell
    network)
* Configuring computer's timezone allows translation of the number to the local time.

Once a compuer has the current time and a timezone set it can easily keep track of time progressing forward **_while it has power_**.

### Keeping track of time without power.

To keep track of time without power you need a reliable source of time when power
restored.  

Most computers we deal with have a [real-time clock](https://en.wikipedia.org/wiki/Real-time_clock) (RTC), which is a little low powered counter (with a battery) that keeps track of a count (time) even when the computer is turned off and unplugged.  

An RTC typically uses a crystal oscillator, like those used in clocks and watches, to keep track of a consistent count allowing the computer to reload 'current' time based on checking on the RTC's counter when it boots backup..

### How do we keep track of that in a computer?

Raspberry Pis, unlike our laptops and PCs, do not have an RTC.

This means when a Pi boots up it defaults to the last time it had prior to boot up and then starts keeping track of time from there.  The default we deal with is usually when either Raspbian was released or when a T3 image was created. This could be many months prior to when you are booting up. 

The Pi defaults to pull current time from the Internet if it has access. An internet connected pi will automatically find the current time.  Once it has a current time if you reboot it it will use the last time it had before reboot so you only lose a minute or two of time and if it still has internet it will update the time again.

Timezones: The converstion of current time to the local time is done through applying the local timezone to the current time. Default Raspbian is in UK (British) timezone.  Default T3 images are in Hawaiian timezone. 

Upon a first boot a Raspberry Pi / T3 Pi will ask you to set the timezone. After that it doesn't ask and you have to manually configure it.

### How does the Pi get time from the Internet?

The default pathway for getting time is to use [Network Time Protocol (NTP)](http://www.ntp.org/).  This is network standard for synchronizing time between computers.  There is an international pool of time servers that partner up and run NTP servers for you to pull time from.  

Default NTP server ports are 123 and require bidirectional communication between the server and the client (your pi).

School firewalls will block non-standard ports and many schools consider NTP non-standard.  So they may block direct NTP server access and/or block the other bidirectional traffic involved in the synchronization process. 

In the school blocking NTP access scenario you two options: 

* Find an NTP server inside the network you are authorized to connect to and manually use it or find an alternative pathway to get time (a hotspot or different non-blocked pathway).
* A school blocking NTP but not blocking web traffic opens up opportunity to use a different time sync protocol & tool that gets time from web servers: htpdate. (see below)


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

Bonus to htpdate approach is you can do your time sync via HTTPS meaning your time synchronization is fully encrypted and therefor more difficult to do cyber sniffing or attacks against.... but that isn't really a serious risk issue to worry about in most contexts.

What I really wish you could do is add htpdate as a fallback when the ntpdate pool fails. 

### What happens if you don't have Internet readily available?  

This pulls you back to that earlier discussion of a Real Time Clock (RTC).

You can get an RTC for a Pi.  Install the RTC,which comes with a battery, and then you just have to make it aware it has an RTC to use to keep track of time between reboots, set the time either manually or via an Internet connection once, and it will keep track of time like a normal computer (with some small amount of skew over time because no RTC is perfect)>

Another offline time source is using a GPS.  GPS adapters/attachments provide time and you can configure your Pi to pull time from the GPS unit.

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

[hilo90mhz](https://twitter.com/chesterlowrey) thought of this silly way of using the `/dev/net` interface: `cat < /dev/tcp/time.nist.gov/13`

Example:
```
cat < /dev/tcp/time.nist.gov/13

58920 20-03-12 20:32:13 50 0 0 941.9 UTC(NIST) *
```

Not as easy to directly use the result from that as the curl example but kinda crazy to think about.

The command line has powerful voodoo!

### T3 time

More details from T3 on this: [T³ Alliance rpi-time and timezones](https://t3alliance.org/lessons/rpi-time-and-timezones/)

