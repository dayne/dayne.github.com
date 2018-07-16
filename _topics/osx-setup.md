---
title: OSX Setup
layout: default
---

# OSX Setup 2018 edition #

This topic got started with my blog post on [Cross Platform Produtivity](/2013/06/10/cross_platform_productivity.html).  June 2018 offered opportunity to setup a new mac allowed me to document the steps taken to configure and install the apps I find useful on a mac:

## 2018 MacBook Pro Setup notes.

* Ensure OSX system updates are applied and reboots needed are done.

* Rename the system: Settings -> Sharing -> insert new name

* install [homebrew](brew.sh)

  `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

* install chrome via homebrew:  `brew cask install google-chrome`

* setup capslock as another control key
  * Settings -> General -> 1) Use Dark Menu 2) Automatically hide menu bar

* Clean-up the Dock
  * Remove most of the apps, ensure terminal & chrome are pinned to dock, auto-launch terminal on boot
  * Settings -> Dock -> 1) Size Small 2) Enable Magnification & set to Max 3) Automatically hide and show the Dock

* Terminal App -> Preferences -> General -> Set `Homebrew` as default profile for new windows.

* Install Spectical for epic key binding based window management
  * Create spectacleapp cask
    ```
    brew cask create spectacleapp
    brew cask install spectacleapp
    'cd /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask && git stash pop'
    brew cask install spectacleapp
    ```
  * Grant it access & learn the keys
  * TODO: Create a PR for it

* typora `brew cask install typora`  for great markdown editing and viewing.

* tmux:  `brew cask install tmux` 

* New SSH key for my system
  * `ssh-keygen`
  * Modify location to`~/.ssh/id_rsa-(machine name)` and **set a passphrase** when prompted.
  * Edit `~/.ssh/id_rsa-(machine name).pub` and append current year & month comment section at end of the line so `(user name)@(machine name-201806`
  * Add the key to your Github.com at http://github.com/settings/ssh a key name aligned with the comment in the key.

* Change Mouse focus for Terminal.App so mouse hovering on a terminal causes focus instead of having to click on the terminal to give focus.
  * `defaults write com.apple.Terminal FocusFollowsMouse -bool true`

* Setup my revision controlled home directory: 
  * `alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
  * `echo '[[ -s $HOME/.bashrc ]] && source $HOME/.bashrc' > .profile`

* Install newer version of bash (4.0) that Apple won't ship by default due to licensing issues.
  * `brew install bash`
  * add `/usr/local/bin/bash` to the `/etc/shells` 
  * Terminal.App -> Preferences -> General -> Shells Open with `/usr/local/bin/bash`
  * Open a new terminal and verify it worked with : `echo $BASH_VERSION` and seeing newer than 3.2

* Install bash-completion: `brew install bash-completion`

* Install iterm2: `brew cask install iterm2` and configure as a drop down terminal:
  * Prefrences -> Profiles -> New Profile -> Set as Default
  * Profile Preferences -> Window 
     * Transparency to right a bit
     * Fuzz it a bit
     * Rows: 30
     * Style: Full-Width Top of screen
  * Profile Preferences -> Keys
     * Check Hotkey Window
     * Set Hotkey to `^;` (control and ; together)
     * Check Pin hotkey window

* Install Docker for Mac : https://store.docker.com/editions/community/docker-ce-desktop-mac

* Install alfred `brew cask install alfred` and configure it for the control + space hot key

* Install Ruby
  * ruby-install `brew install ruby-install`
  * chruby `brew install chruby`
  * ruby-install Install Ruby: `ruby-install ruby-2.5.1`

* Install Gimp photo editor - `brew cask install gimp`
  * alias gimp='open -a gimp'

* needed `convert` so installed imagemagick: `brew install imagemagick` 

* `brew install ngrok`
  * (connect my account https://dashboard.ngrok.com/get-started)

---
# OLD STUFF
Below is the old version (2013 era) setup notes for OSX:

<details><summary>Click to see the old (2013 era) setup notes</summary>
<p>

# OSX Setup 2013 Era 

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
</p>
</details>
