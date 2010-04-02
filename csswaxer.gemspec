# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{csswaxer}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Claudio Baccigalupo"]
  s.date = %q{2010-04-02}
  s.default_executable = %q{csswaxer}
  s.description = %q{CSS Waxer refactors CSS files bringing the focus on properties, rather than on selectors. Typically, CSS files are written by groups of selectors, you first specify all the properties of <body>, then those of <h1>, #header, and so on. This makes it hard to catch a glimpse of the overall style of a site, such as the entire list of colors used, the fonts, or the dimensions. CSS Waxer reorders the lines of a CSS files so that properties are grouped together by family. In this way, you can rapidly check together all the fonts used, the colors, backgrounds, layouts and so on for the whole site.}
  s.email = %q{claudiob@gmail.com}
  s.executables = ["csswaxer"]
  s.extra_rdoc_files = ["LICENSE","README.md"]
  s.files = ["README.md", "Rakefile", "LICENSE", "VERSION", "bin/csswaxer", "lib/csswaxer.rb", "lib/example.css"]
  s.homepage = %q{http://github.com/claudiob/csswaxer}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Command-line tool that makes stylesheet files more readable, grouping lines by property (typography, color, layout, etc.) rather than by selector}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<css_parser>, [">= 1.0.1"])
    else
      s.add_dependency(%q<css_parser>, [">= 1.0.1"])
    end
  else
    s.add_dependency(%q<css_parser>, [">= 1.0.1"])
  end
end
