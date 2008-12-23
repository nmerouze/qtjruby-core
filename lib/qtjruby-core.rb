require 'rubygems'
require 'pathname'
dir = Pathname(__FILE__).dirname.expand_path

gem 'extlib', '~>0.9.9'
require 'extlib'

qtjambi_dir = ENV_JAVA['jruby.home'] || Dir.pwd
Dir.glob(qtjambi_dir / 'lib' / 'qtjambi-*.jar') { |jar| require jar }
require dir / 'qtjruby-core.jar'
require dir / 'qtjruby-core' / 'qt'