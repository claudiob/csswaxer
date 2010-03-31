# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{csswaxer}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Claudio Baccigalupo"]
  s.date = %q{2010-03-31}
  s.default_executable = %q{csswaxer}
  s.description = %q{CSS files are written with a focus on selectors, so that all properties related to a tag, class or id are grouped together. This makes it hard to a have a clear overview of the style; for instance which colors and fonts are used in the whole site. CSS Waxer reorganizes CSS files focusing on properties, so that every font-related property is packed together, followed by colors, backgrounds, layouts and so on.}
  s.email = %q{claudiob@gmail.com}
  s.executables = ["csswaxer"]
  s.extra_rdoc_files = ["LICENSE","README.md"]
  s.files = ["README.md", "Rakefile", "LICENSE", "VERSION", "bin/csswaxer", "lib/csswaxer.rb", "lib/example.css"]
  s.homepage = %q{http://github.com/claudiob/csswaxer}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Command-line tool that makes stylesheet files more readable, grouping lines by property (typography, color, layout, …) rather than by selector}

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
