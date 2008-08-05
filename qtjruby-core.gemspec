Gem::Specification.new do |s|
  s.name = %q{qtjruby-core}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicolas M\303\251rouze"]
  s.date = %q{2008-07-29}
  s.default_executable = %q{qtjruby}
  s.description = %q{Qt meets Java meets Ruby.}
  s.email = %q{nicolas.merouze@gmail.com}
  s.executables = ["qtjruby"]
  s.files = ["LICENSE", "README.textile", "Rakefile", "TODO", "bin/qtjruby", "lib/qtjruby-core", "lib/qtjruby-core.jar", "lib/qtjruby-core.rb", "lib/qtjruby-core/core_ext", "lib/qtjruby-core/core_ext.rb", "lib/qtjruby-core/qt", "lib/qtjruby-core/qt.rb", "lib/qtjruby-core/version.rb", "lib/qtjruby-core/core_ext/class.rb", "lib/qtjruby-core/core_ext/module.rb", "lib/qtjruby-core/core_ext/object.rb", "lib/qtjruby-core/core_ext/rubygems.rb", "lib/qtjruby-core/core_ext/string.rb", "lib/qtjruby-core/qt/ext", "lib/qtjruby-core/qt/ext/application.rb", "lib/qtjruby-core/qt/ext/object.rb"]
  s.homepage = %q{http://www.qtjruby.org}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Qt meets Java meets Ruby.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
