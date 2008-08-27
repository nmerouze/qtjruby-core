Gem::Specification.new do |s|
  s.description = "Qt meets Java meets Ruby."
  s.files = ["LICENSE",
 "README.textile",
 "Rakefile",
 "TODO",
 "bin/qtjruby",
 "lib/qtjruby-core",
 "lib/qtjruby-core.jar",
 "lib/qtjruby-core.rb",
 "lib/qtjruby-core/qt",
 "lib/qtjruby-core/qt.rb",
 "lib/qtjruby-core/version.rb",
 "lib/qtjruby-core/qt/ext",
 "lib/qtjruby-core/qt/ext/application.rb",
 "lib/qtjruby-core/qt/ext/object.rb"]
  s.rubygems_version = "1.2.0"
  s.platform = "java"
  s.date = "Wed Aug 27 00:00:00 +0200 2008"
  s.homepage = "http://qtjruby.org"
  s.add_dependency "extlib", ">= 0.9.5"
  s.executables = ["qtjruby"]
  s.bindir = "bin"
  s.summary = "Qt meets Java meets Ruby."
  s.specification_version = "2"
  s.email = "nicolas.merouze@gmail.com"
  s.version = "0.2.2"
  s.required_rubygems_version = ">= 0"
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 0"
  s.extra_rdoc_files = ["LICENSE", "README.textile"]
  s.has_rdoc = "true"
  s.name = "qtjruby-core"
  s.authors = ["Nicolas Merouze"]
  s.loaded = "false"
end