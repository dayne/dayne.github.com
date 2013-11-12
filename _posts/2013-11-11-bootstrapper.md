---
title: "bootstrapper"
layout: post
---
# {{page.title}}
 
<p class='#meta'>{{page.date}}</p>

I am considering my recent conversion of this website to [bootstrap](http://getbootstrap.com/) a smashing success.  This post is to to primarily act as a reminder of the basics and to hopefully help guide [Josh](http://josh.broderson.org) on his website rewrite.  You can still see a version of my [old site archived here](/random/trying_out_jekyll.html) which was just a minor modification of the Jekyll author [mojombo's github website](http://tom.preston-werner.com/)

Going to a place like the [getting started examples](http://getbootstrap.com/getting-started/#examples) and picking one to [view the source](view-source:http://getbootstrap.com/examples/navbar-static-top/) of like [jumbotron navbar example](http://getbootstrap.com/examples/navbar-static-top/) is the way to go.

For my [jekyll](http://jekyllrb.com/) website this meant I was tweaking my [_layouts/default.html](https://github.com/dayne/dayne.github.com/blob/master/_layouts/default.html) while runnng ```jekyll server --watch``` and refreshing [http://localhost:7000](http://localhost:7000).

After I got the basics worked out I was pleased with how little work was required to tweak existing content and how well the website looked on mobile platforms like my [Nexus 7](http://www.google.com/nexus/7/)

Next steps:

* [add font magic](/random/font_import_test.html) which was discussed three years ago's [Sweet Fonts post](/2010/11/13/fonts.html)
* create a [reveal.js](http://lab.hakim.se/reveal-js/#/) slideshow that fits here

### basic html

I have kept things fairly simple. Basic of the html is:

    <html>
    <head>
      # you know, title, metata stuff 
      # include css (see below)
    </head>
    <body>
      <div class="container">
        <div class="header">
        </div>
        <div class="hero-unit">
           # the content here
        </div> <!-- end main
        </div class="footer">
        </div> <!-- end footer -->
      </div> <!-- end container -->
      # now include your javascript (see below)
    </body>
    </html>

Not a far cry from my first [html5 silly sample](http://dayne.broderson.org/random/html5-silly-sample.txt).

### At the top (in header)

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
    
    <!-- bootstrap jumbotron template css -->
    <link rel="stylesheet" href="/css/jumbotron-narrow.css" type="text/css" />

### At the bottom (after footer before end of body)

    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
