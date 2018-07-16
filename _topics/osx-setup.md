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
