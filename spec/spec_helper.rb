# jruby -J-XstartOnFirstThread spec/*_spec.rb
require 'rubygems'

gem 'rspec'
require 'spec'

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'qtjruby-core'