---
title: OSX Setup
layout: default
---

# OSX Setup #

This topic got started with my blog post on [Cross Platform Produtivity](/2013/06/10/cross_platform_productivity.html).

System Preferences -> Keyboard -> Modifier Keys -> Capslock as Control

System Preferences -> Mission Control -> Hot Corners : Top Left Application Windows - Top Right Mission Control

System Preferences -> Dock -> Check Automatically hide and show the Dock & Enable Magnification

Disable the dashboard (who uses that?) via terminal

```
defaults write com.apple.dashboard mcx-disabled -boolean true
killall Dock
```

## Basics - App Store Installs ##

* Xcode : https://developer.apple.com/xcode/
 * Once installed launch, accept license and then install command line utils via terminal:
 * ```xcode-select --install```
* Evernote - Note taking
* Skitch - Screen cap/image scribbler
* OmniGraffle - Diagram/Graph editing
* Acorn 4 - Photoshop alternative
* Apeture - Photo editing software
* Flint - Campfire client
* Keynote - Present those slides
* Twitter - Yeah
* Growl - App messaging
* MPlayerX - Watch them movies

## Basics - Download and Installs (outside of AppStore)

* [TotalTerminal](http://totalterminal.binaryage.com)
 * Preferences -> Total Terminal -> set to use control + ; to launch
 * Preferences -> Startup -> Default -> Pro
 * Preferences -> Settings -> (Pro) -> Shell -> When the shell exits: Close if the shell exited cleanly
* [Google Chrome](http://chrome.google.com)
* [Google Earth](http://earth.google.com) 
* [Alphred](http://www.alphredapp.com) - App Launcher
 * Set to use control + space to launch it
* [XQuartz](http://xquartz.macosforge.org/landing/) - X.Org of OSX
* [GitHub Mac](http://mac.github.com) 
 * Install the command line utils during first launch

## Advanced Science ##

Time to get the real magic sauce going that transforms this bucket into a rocket ship.  Make sure you got GitHub Mac, XCode and the XCode command line utils already.

### Homebrew

This is installed via ruby which OSX 10.9 (Mavericks) ships with ruby2.0.0p247.  Awesome enough for me.

```
# put it here
```


