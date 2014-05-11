---
title: OSX Setup
layout: default
---

# OSX Setup v1311 #

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

* Xcode : [developer.apple.com/xcode](https://developer.apple.com/xcode/)
* Once Xcode is installed launch it and accept the license and then install command line utils via terminal:
  * ```xcode-select --install```
* Evernote - Note taking
* Skitch - Screen cap/image scribbler
* OmniGraffle - Diagram/Graph editing *$$$*
* Acorn 4 - Photoshop alternative *$$$*
* Apeture - Photo editing software *$$$*
* Flint - Campfire client *$$$* 
* Keynote - Present those slides 
* Twitter - Yeah 
* Growl - App messaging 
* MPlayerX - Watch them movies

## Basics - Download and Installs 

The following are non-AppStore installs:

* [TotalTerminal](http://totalterminal.binaryage.com)
  * Preferences -> Total Terminal -> set to use control + ; to launch
  * Preferences -> Startup -> Default -> Pro
  * Preferences -> Settings -> (Pro) -> Shell -> When the shell exits: Close if the shell exited cleanly
* [Google Chrome](http://chrome.google.com)
* [Google Earth](http://earth.google.com) 
* [Alphred](http://www.alphredapp.com) - App Launcher
  * Set to use control + space to launch it
* [XQuartz](http://xquartz.macosforge.org/landing/) - X.Org of OSX
* [git-annex](#git-annex) *see section below*
* [GitHub Mac](http://mac.github.com) 
  * Install the command line utils during first launch
* [Ruby](#ruby) *see section below*
* [Homebrew](#homebrew) *see section below*

## Advanced Science ##

Time to get the real magic sauce going that transforms this bucket into a rocket ship.  Make sure you got GitHub Mac, XCode and the XCode command line utils already.

### [Homebrew](id:homebrew) ##

This is installed via ruby which OSX 10.9 (Mavericks) ships with ruby2.0.0p247.  Awesome enough for that job but not for long.

```
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)
# ... let that do magic
# then general magic follows:
brew doctor  # sanity check brew
brew search  # search for an application
brew install <application-name> # install it
brew list    # list all programs installed 
brew remove <application-name>  # toast it
brew update  # keep your brew happy
cd /usr/local/Cellar # check out your stuff
```

If all is kosher then time to slam home a pile of tools:

```
brew install htop moreutils tmux tree
```

### [Ruby](id:ruby) ###

```
brew install chruby 
brew install ruby-build
ruby-build 2.0.0-p247
chruby 2.0.0-p247
```


### [git-annex](id:git-annex) ###

Download the dmg file: [http://git-annex.branchable.com/install/OSX/](http://git-annex.branchable.com/install/OSX/)

Copy it to your Applications folder and in Finder right click on it to open it.

Then add the following to your .bashrc

```
# GIT ANNEX
ANNEX_HOME=/Applications/git-annex.app/Contents/MacOS
if [[ -s $ANNEX_HOME ]]; then
  PATH=$PATH:$ANNEX_HOME
fi
```

### [chef](id:chef) ###

```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```

<em>2013.11.23: Latest OSX failed. See following gist for the fix: [install chef OSX mavericks](https://gist.github.com/driesvints/7160641)</em>

<div class="alert alert-warning"><h2><span class="glyphicon glyphicon-warning-sign"></span> 
*below is unfinished* 
</h2></div>

## more stuff

* vagrant
