require 'rubygems'
require 'pathname'

dir = Pathname(__FILE__).dirname.expand_path
require dir / 'qtjruby-core.jar'
require dir / 'qtjruby-core' / 'qt'