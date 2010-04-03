#!/usr/bin/env ruby

# Author::    Claudio Baccigalupo
# Copyright:: Copyright (c) 2010 - see LICENSE file

require 'css_parser'
require 'open-uri'

module CssWaxer
  class << self

    # Return a waxed version of a dirty CSS file, either local or remote
    def wax(dirty_css)
      # Open either a local or a remote file depending on the path
      parser = CssParser::Parser.new    
      if dirty_css =~ /^https?:\/\/\S+$/i then
        parser.load_uri! dirty_css
      else
        parser.load_file! dirty_css
      end
      
      properties = {}
      # First make sure to take the most important property values for each selector
      parser.each_selector(:screen).each do |ruleset|
        ruleset[:rules].expand_shorthand! # NOTE: list-style is not affected
        declarations = ruleset[:rules].instance_variable_get(:@declarations)
        ruleset[:rules].selectors.each do |selector|
          declarations.each do |property, values|
            triple = [selector.strip, [values[:value].strip, values[:is_important]]]
            unless properties.has_key?(property)
              properties[property] = []
            end
            previous_value = properties[property].assoc(selector.strip)
            if previous_value.nil? 
              properties[property] << triple
            # Overwrite only if more important than the existing value
            elsif !previous_value[1][1] || values[:is_important]
              previous_value[1] = [values[:value].strip, values[:is_important]]
            end
          end      
        end
      end

      # Next merge selectors with the same values for each property to save space
      merged = {}
      properties.each do |property, values|
        merged[property] = []
        values.each do |triple|
          if previous_value = merged[property].assoc(triple[1])
            previous_value[1] << triple[0]
          else
            merged[property] << [triple[1], [triple[0]]]
          end
        end
      end
      
      # Finally write to CSS, ordered by family
      css_families.each do |family, properties|
        next unless merged.keys.any?{|property| properties.include? property}
        puts titleize(family)
        properties.each do |property|
          next unless merged.has_key? property
          puts "/* #{property} */"
          merged[property].each do |values, selectors|
            important = " !important" if values[1]
            puts "#{selectors.join(", ")}\t{#{property}: #{values[0]}#{important}}"
          end
          merged.delete property
        end
      end
      # Write the remaining (unrecognized) properties at the end
      unless merged.empty?
        puts titleize("Unrecognized properties")
        merged.each do |property, values_and_selectors|
          puts "/* #{property} */"
          values_and_selectors.each do |values, selectors|
            important = " !important" if values[1]
            puts "#{selectors.join(", ")}\t{#{property}: #{values[0]}#{important}}"
          end
          merged.delete property
        end
      end
    end
  
    private
    
    def titleize(title)
      "\n/* #{'*'*73} */\n/* #{title.upcase}#{' '*(73-title.upcase.length)} */\n/* #{'*'*73} */\n"  
    end
    
    def css_families
      # Based on the list from http://www.eskimo.com/~bloo/indexdot/css/
      [
        ['Typography', %w{font-family font-size font-style font-variant font-weight font font-size-adjust font-stretch line-height}],
        ['Text', %w{word-spacing letter-spacing white-space word-wrap text-align text-align-last text-decoration text-transform text-shadow text-indent text-underline-position}],
        ['Colors', %w{color background-color layer-background-color border-top-color border-right-color border-bottom-color border-left-color border-color scrollbar-face-color scrollbar-arrow-color scrollbar-base-color scrollbar-shadow-color scrollbar-darkshadow-color scrollbar-highlight-color scrollbar-3dlight-color scrollbar-track-color outline-color}],
        ['Backgrounds', %w{layer-background-image background-image background-repeat background-attachment background-position background-position-x background-position-y background}], 
        ['Outlines', %w{outline-style outline-width outline}],
        ['Lists', %w{marker-offset list-style-type list-style-position list-style-image list-style}],
        ['Tables', %w{border-collapse border-spacing caption-side empty-cells speak-header table-layout}],
        ['Layout', %w{display visibility position float clear}],
        ['Sizes', %w{width min-width max-width height min-height max-height}],
        ['Positions', %w{top right bottom left vertical-align 	overflow overflow-x overflow-y text-overflow clip z-index}],
        ['Margins', %w{margin-top margin-right margin-bottom margin-left margin}],
        ['Paddings', %w{padding-top padding-right padding-bottom padding-left padding}],
        ['Borders', %w{border-top border-right border-bottom border-left border-top-width border-right-width border-bottom-width border-left-width border-width border-top-style border-right-style border-bottom-style border-left-style border-style border}],
        ['Dynamic', %w{accelerator cursor filter behavior zoom}],
        ['Generated', %w{content counter-reset counter-increment include-source quotes}],
        ['International', %w{unicode-bidi direction ruby-align ruby-overhang ruby-position line-break word-break writing-mode ime-mode text-justify text-autospace text-kashida-space layout-flow layout-grid-mode layout-grid-type layout-grid-line layout-grid-char layout-grid-char-spacing layout-grid  }],
        ['Printing', %w{page-break-before page-break-inside page-break-after 	page size marks widows orphans}],
        ['Aural', %w{volume stress richness azimuth elevation voice-family speak-punctuation speak-numeral speak pitch-range pitch speech-rate play-during pause-before pause-after pause cue-before cue-after cue}],
        ['Opera', %w{-replace  -set-link-source  -use-link-source}],
        ['Mozilla', %w{-moz-binding  -moz-border-radius  -moz-border-radius-topleft  -moz-border-radius-topright  -moz-border-radius-bottomright  -moz-border-radius-bottomleft  -moz-border-top-colors  -moz-border-right-colors  -moz-border-bottom-colors  -moz-border-left-colors  -moz-opacity  -moz-outline  -moz-outline-color  -moz-outline-style  -moz-outline-width  -moz-user-focus  -moz-user-input  -moz-user-modify  -moz-user-select}]
      ]
    end
  end 
end