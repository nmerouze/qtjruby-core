### If you use jruby-complete, uncomment the code below first:
# require 'rubygems'
# 
# if File.exist?(gem_dir = File.join(Dir.pwd, 'gems'))
#   Gem.clear_paths
#   Gem.path.unshift(gem_dir)
# end
# 
# gem 'extlib', '~> 0.9.9'
# require 'extlib'
# 
# Dir.glob(Dir.pwd / 'lib' / 'qtjambi-*.jar') { |jar| require jar }
# require 'qtjruby-core'
Qt::Application.initialize(ARGV)
hello = Qt::PushButton.new 'Hello World!'
hello.resize(120, 40)
hello.window_title = 'Hello World'
hello.show
Qt::Application.exec