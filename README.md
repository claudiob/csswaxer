# CssWaxer #

Ruby command that prettifies CSS files grouping lines by property rather than by selector

## Installation (from GemCutter) ##

    gem install csswaxer

## Examples ##

    csswaxer http://rubygems.org/stylesheets/all.css
    csswaxer http://vlex.cachefly.net/stylesheets/new.css

## To do ##

* Accept CSS files with commands split on multiple lines
* Accept local CSS files, not only remote ones
* Accept different media types, not only screen
* Contain every possible CSS property
* Re-organize families of properties in the output  (first font, then text...)

## History ##

v0.0.4  2010/03/31
        Fixed a bug; now also respects !important statements
         
v0.0.3  2010/03/28
        Fixed a bug; now also works on remote CSS files

v0.0.1  2010/03/28
        First commit that only works on CSS files with one-line style.

## Copyright ##

Copyright (c) 2010 Claudio Baccigalupo. See LICENSE for details.
