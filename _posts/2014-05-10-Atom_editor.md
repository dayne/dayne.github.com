---
layout: post
title: Atom Editor & Deckset
---

# Atom Editor

Well this last week a pleasant surprise came out.
[GitHub](https://github.com) released their next
generation programming  editor from beta
[Atom Editor](http://atom.io) as  open source.

I had pulled down atom as a beta testor a while
back but didn't stop and really try to use it since
I typically live in vim in those rare moments I
find myself trying to code these days.  Google Docs
is where I live most of the time these days. Since I
last looked their is now a vim keybindings plugin
and **it worked**.

This post was written in Atom and the best thing ever
 during this is the markdown preview pane.

![atom editor markdown preview pane](/images/atom-editor-markdown_preview.jpg)

Now I've got a handy preview pane to let me know
if I'm remembering my markdown syntax correctly
and extra bonus is there is a spell checker built
into atom editor that give me the red squiggle of
of warning for me. :+1:

### Atom editor setup

Install for your platform and then do the following:

* Atom Menu &#8594; Install Shell Commands
 * Gives you two command line apps: atom and apm (tool to install pcakges)
* Atom Menu &#8594; Preferences &#8594; Packages &#8594; Install Packages
 * [Vim Mode Plus](https://github.com/t9md/atom-vim-mode-plus)
   * ```apm install vim-mode-plus```
 * [Zen](https://atom.io/packages/Zen) # distraction free writing
   * ```apm install zen```

Find more cool packages at
[https://atom.io/packages/](https://atom.io/packages/vim-mode)

This functionality is super handy for the other
application I've been trying to add to my tool chest
a markdown based slideshow tool called
[Deckset](http://decksetapp.com) that
[teknofire](http://teknofire.net) showed me recently.

# Deckset

[Deckset](http://www.decksetapp.com/) (OSX only)
takes a simple markdown document formatted
just right and turns it into a slideshow.  Weirdly
enough Deckset is magically aware of atom and when
open it will create a little preview pane overlay.

Exmple 3 slide Deckset markdown:

```markdown
# [fit] Welcome Slide

---

# [fit] Second Slide

## [damnitalex](http://damnitalex.com) time

![fit](http://damnitalex.com/images/photo.JPG)

---

![fit](http://damnitalex.com/images/photo.JPG)

```

![deckset-example slides](/images/deckset-example.jpg)

I find myself wondering how much more I could integrate
markdown into my work related writing I end up doing.

Perhaps my next proposal I can do in the Atom Editor
with Markdown.  

Fun times :sparkles:
