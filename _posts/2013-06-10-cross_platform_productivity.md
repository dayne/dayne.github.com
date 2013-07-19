---
layout: post
title: Cross Platform Productivity
---

# {{page.title}}

<p class='#meta'>12th June 2013 - Fairbanks</p>

Bouncing between a variety of machines and platforms regulary (multiple times in an hour) I find myself gravitating to a few tools available to just make it easy.  

Capslock as Control - I don't care what platform I'm on - I want my control key where everybody keeps putting that useless key CAPSLOCK.  Also handy for later on when I want simple keybinds consistent across platforms.

[Google Chrome](http://google.com/chrome) web browser keeps track of things (browsing history) very well as I bounce between machines I don't even think about where I was opening up a window - I just start typing in the address bar and chrome starts autofilling based on any one of my boxes browsing history.  Creepy - but creepy awesome.

## MacOSX

[Alphred the Launcher](http://www.alfredapp.com/) provides me a launcher window with autocompletion.  I don't even know how to launch applications in OSX correctly without using a terminal or Alphred.  I use CONTROL+<space> to bring Alphred up.

[TotalTerminal](http://totalterminal.binaryage.com/) provides a quake style drop down terminal that slides down from the top of the screen on top of whatever I'm looking at (usually a chrome window).  I use CONTROL+; to toggle TotalTerminal.  I launch it after a reboot by bringing up Alphred since I never learned how to make it auto launch on reboot.

[Evernote's Skitch](http://evernote.com/skitch/) is the last puzzle peice for easy to annotate screen clips.  Launch with Alpphred and then you can CONTROL+SHIFT+5 to trigger a screen clip. Available in AppStore

*MplayerX* video player - Available in AppStore

*Xcode* compilers - need command line tools installed so homebrew is an option

System Preferences -> Keyboard -> Modifier Keys -> Capslock as Control

Terminal hidden in Utilities 

*Growl* - Available in AppStore  

The rest of making a Mac box useful comes from TotalTerminal and [HomeBrew](http://mxcl.github.io/homebrew/)

Misc other things to install on OSX

* [XQuartz](http://xquartz.macosforge.org/landing/) will be needed for homebrew deps
* [rbenv](http://rbenv.org/) and ruby-build for getting a good ruby


## Windows

First thing a Windows box needs out of the way is the CAPSLOCK issue using a [Windows Registry Key Re-Mapping](http://www.howtogeek.com/howto/windows-vista/disable-caps-lock-key-in-windows-vista/).

[Launchy](http://www.launchy.net/) is the Alphred for windows.  Again I use CONTROL+<space> to trigger Launchy.

[Skitch](http://evernote.com/skitch) is also required but not as full featured as the MacOSX version.

I need a TotalTerminal Windows alternative that hands me a PowerShell. I've not bothered to find that yet since there isn't a homebrew alternative for Windows solution I like.  Clearly I don't use windows too much except for MS Office and conference sharing requirements.

## Linux

Terminals everywhere solve my problem.  I miss skitch for Linux. 

*Gnome DO* or [Launchy](http://www.launchy.net/) - `yum install launchy` - either way bind to control-space again

[Shutter](http://shutter-project.org/) -- `yum install shutter`

For some reason I don't use a TotalTerminal like option in Linux 
(dispite plenty available).
