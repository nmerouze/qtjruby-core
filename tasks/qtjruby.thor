#!/usr/bin/env ruby
require 'thor'
require 'net/http'
require 'open-uri'

##############################################################################

module ColorfulMessages
  
  # red
  def error(*messages)
    puts messages.map { |msg| "\033[1;31m#{msg}\033[0m" }
  end
  
  # yellow
  def warning(*messages)
    puts messages.map { |msg| "\033[1;33m#{msg}\033[0m" }
  end
  
  # green
  def success(*messages)
    puts messages.map { |msg| "\033[1;32m#{msg}\033[0m" }
  end
  
  alias_method :message, :success
  
  # magenta
  def note(*messages)
    puts messages.map { |msg| "\033[1;35m#{msg}\033[0m" }
  end
  
  # blue
  def info(*messages)
    puts messages.map { |msg| "\033[1;34m#{msg}\033[0m" }
  end
  
end

##############################################################################

class Qtjruby < Thor
  
  class Stack < Thor
    
    include ColorfulMessages
    
    desc 'install name', 'Install an application with the full stack'             
    def install(dir)
      # Create application dir
      FileUtils.mkdir(dir)
      puts "[ADDED] #{dir}"
      # Create lib dir
      lib_dir = FileUtils.mkdir(dir + '/lib')
      puts "[ADDED] #{dir}/lib"
      # Create main.rb
      File.open("#{dir}/main.rb", "w") do |file|
        file.write <<-RUBY
require 'rubygems'

if File.exist?(gem_dir = File.join(Dir.pwd, 'gems'))
  Gem.clear_paths
  Gem.path.unshift(gem_dir)
end

gem 'extlib', '~> 0.9.9'
require 'extlib'

Dir.glob(Dir.pwd / 'lib' / 'qtjambi-*.jar') { |jar| require jar }

require 'qtjruby-core'
        RUBY
      end
      puts "[ADDED] #{dir}/main.rb"
      # Download jruby-complete
      jar_version = '1.1.6'
      File.open("#{lib_dir}/jruby-complete-#{jar_version}.jar", "wb") do |file|
        file.write(open("http://repository.codehaus.org/org/jruby/jruby-complete/#{jar_version}/jruby-complete-#{jar_version}.jar").read)
      end
      puts "[ADDED] #{dir}/lib/jruby-complete-#{jar_version}.jar"
      # Install extlib
      Dir.chdir(dir) do
        `java -jar lib/jruby-complete-#{jar_version}.jar -S gem install extlib -i gems`
      end
      puts "[ADDED] extlib gems in #{dir}/gems"
      # TODO: Download qtjambi jar
      # TODO: Handle errors and exceptions
    end
    
  end
  
end