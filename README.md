# CssWaxer #

Ruby command that prettifies CSS files grouping lines by property rather than by selector

## Installation (from GemCutter) ##

    gem install csswaxer

## Examples ##

    csswaxer http://rubygems.org/stylesheets/all.css
    csswaxer http://vlex.com/stylesheets/new.css

## To do ##

* Add a proper wiki
* Accept CSS files with commands split on multiple lines
* Accept different media types, not only screen
* Contain every possible CSS property
* Align TABS for each property
* Also expand shorthand property list-style (css_parser does not)
* Recreate shorthand formats in the final output

## Other styles of CSS Code Readability ##

[Loud Dog](http://www.louddog.com/bloggity/2008/03/css-best-practices.php)

[Smashing Magazine](http://www.smashingmagazine.com/2008/05/02/improving-code-readability-with-css-styleguides/)

## History ##

v0.0.7  2010/04/03
        Expanded shorthand properties: background, font, margin, padding

v0.0.6  2010/04/02
        Requires CSS Parser > 1.1.0 which includes load_file!

v0.0.5  2010/04/02
        Fixed a bug; now respects multiple property values for the same selector

v0.0.4  2010/03/31
        Fixed a bug; now also respects !important statements
         
v0.0.3  2010/03/28
        Fixed a bug; now also works on remote CSS files

v0.0.1  2010/03/28
        First commit that only works on CSS files with one-line style.

## License ##

Released in the public domain under the Ruby license. See LICENSE for details.
