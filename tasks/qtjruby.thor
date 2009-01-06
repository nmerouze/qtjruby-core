#!/usr/bin/env ruby
require 'thor'
require 'net/http'
require 'open-uri'

JRUBY_VERSION   = '1.1.6'
QTJAMBI_VERSION = '4.4.3_01'
QTJRUBY_VERSION = '0.3.0'
EXTLIB_VERSION  = '0.9.9'

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

module Helpers
  def download(source, dir)
    filename    = File.basename(source)
    destination = "#{dir}/#{filename}"
    
    if File.exist?(destination)
      message "[EXIST] #{destination}"
    else
      File.open(destination, "wb") do |file|
        info "Downloading #{filename}..."
        file.write(open(source).read)
      end

      success "[ADDED] #{destination}"
    end
  end
  
  def install_gem(name, dir)
    Dir.chdir(dir) do
      info "Installing #{name} gem..."
      `java -jar lib/jruby-complete-#{JRUBY_VERSION}.jar -S gem install #{name} -i gems`
    end
    success "[ADDED] #{name} gem in #{dir}/gems"
  end
  
  def create_dir(dir)
    if File.exist?(dir)
      message "[EXIST] #{dir}"
    else
      FileUtils.mkdir(dir)
      success "[ADDED] #{dir}"
    end
  end
  
  def create_file(name, dir, &block)
    destination = "#{dir}/#{name}"
    
    if File.exist?(destination)
      message "[EXIST] #{destination}"
    else
      File.open(destination, "w", &block)
      success "[ADDED] #{destination}"
    end
  end
end

##############################################################################

class Qtjruby < Thor
  
  class App < Thor
    
    include ColorfulMessages
    include Helpers
    
    desc 'create name', 'Create a Qt::JRuby application'             
    def create(dir)
      # Create application dir
      create_dir(dir)
      # Create lib dir
      create_dir(lib_dir = dir + '/lib')
      # Create main.rb
      create_file('main.rb', dir) do |file|
        file.write <<-RUBY
# java -jar lib/jruby-complete-#{JRUBY_VERSION}.jar main.rb
Dir.glob(File.dirname(__FILE__) + '/lib/qtjambi-*.jar') { |jar| require jar }
require 'rubygems'

Gem.clear_paths
Gem.path.unshift(File.dirname(__FILE__) + '/gems')

gem 'extlib', '~> #{EXTLIB_VERSION}'
require 'extlib'

gem 'qtjruby-core', '~> #{QTJRUBY_VERSION}'
require 'qtjruby-core'

Qt::Application.initialize(ARGV)
hello = Qt::PushButton.new 'Hello World!'
hello.resize(120, 40)
hello.window_title = 'Hello World'
hello.show
Qt::Application.exec
        RUBY
      end
      # Download jruby-complete
      download("http://repository.codehaus.org/org/jruby/jruby-complete/#{JRUBY_VERSION}/jruby-complete-#{JRUBY_VERSION}.jar", lib_dir)
      # Download qtjambi
      download("http://qtjruby.googlecode.com/files/qtjambi-#{QTJAMBI_VERSION}.jar", lib_dir)
      # Download qtjambi specific files
      case RUBY_PLATFORM
      when /win32|mingw|bccwin|cygwin/
        download("http://qtjruby.googlecode.com/files/qtjambi-win32-msvc2005-#{QTJAMBI_VERSION}.jar", lib_dir)
      when /darwin/
        download("http://qtjruby.googlecode.com/files/qtjambi-macosx-gcc-#{QTJAMBI_VERSION}.jar", lib_dir)
      else
        download("http://qtjruby.googlecode.com/files/qtjambi-linux32-gcc-#{QTJAMBI_VERSION}.jar", lib_dir)
      end
      # Install qtjruby
      install_gem('qtjruby-core', dir)
    end
    
  end
  
end