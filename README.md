# RadioTagMap #

Ruby command that prettifies CSS files grouping lines by property rather than by selector

## Installation ##

    gem install csswaxer

## Documentation ##

[http://rdoc.info/projects/claudiob/csswaxer](http://rdoc.info/projects/claudiob/csswaxer)

## Examples ##

### To create a KML map according to compare current 'Rock' and 'Country' songs 

    require 'radiotagmap'
    Radiotagmap::update_kml '/tmp/overlay.kml' [['Country','Alt-Country']]

## To do ##

* Accept CSS files with commands split on multiple lines
* Accept local CSS files, not only remote ones
* Accept different media types, not only screen
* Contain every possible CSS property, well organized 

## History ##

v0.0.1  2010/03/28
        First commit that only works on CSS files with one-line style.

## Copyright ##

Copyright (c) 2010 Claudio Baccigalupo. See LICENSE for details.
