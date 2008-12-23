require 'rubygems'
require 'pathname'
dir = Pathname(__FILE__).dirname.expand_path

if File.exist?(dir = File.join(Dir.pwd, 'gems'))
  Gem.clear_paths
  Gem.path.unshift(dir)
end

gem 'extlib', '>=0.9.9'
require 'extlib'

qtjambi_dir = ENV_JAVA['jruby.home'] || Dir.pwd
Dir.glob(qtjambi_dir / 'lib' / 'qtjambi-*.jar') { |jar| require jar }
require dir / 'qtjruby-core.jar'
require dir / 'qtjruby-core' / 'qt'