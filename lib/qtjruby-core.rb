require 'java'
require 'rubygems'

gem 'extlib', '>=0.9.5'
require 'extlib'

Dir.glob(ENV_JAVA['jruby.home'] / 'lib' / 'qtjambi-*.jar') { |jar| require jar }
require 'qtjruby-core.jar'
require 'qtjruby-core' / 'qt'