require 'rake'
require 'rake/gempackagetask'

windows = (ENV_JAVA['os.name'] =~ /Windows/) rescue nil
SUDO = windows ? "" : "sudo"

NAME = 'qtjruby-core'

require "lib/qtjruby-core/version"

task :default => [:build, :install]

spec = Gem::Specification.new do |s|
  s.name         = NAME
  s.version      = Qt::JRuby::VERSION
  s.platform     = Gem::Platform::RUBY
  s.author       = "Nicolas Mérouze"
  s.email        = "nicolas.merouze@gmail.com"
  s.homepage     = "http://www.qtjruby.org"
  s.summary      = "Qt meets Java meets Ruby."
  s.bindir       = "bin"
  s.description  = s.summary
  s.executables  = %w( qtjruby )
  s.require_path = "lib"
  s.files        = %w( LICENSE README.textile Rakefile TODO ) + Dir["{bin,lib}/**/*"]

  # rdoc
  s.has_rdoc         = false
end

Rake::GemPackageTask.new(spec) do |package|
  package.gem_spec = spec
end

task :build do
  sh %{ant -lib #{ENV_JAVA['jruby.home']}/lib}
end

task :install => :package do
  sh %{#{SUDO} #{ENV_JAVA['jruby.home']}/bin/jruby -S gem install pkg/#{NAME}-#{Qt::JRuby::VERSION}.gem --no-rdoc --no-ri}
end