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
  s.author       = "Nicolas Merouze"
  s.email        = "nicolas.merouze@gmail.com"
  s.homepage     = "http://qtjruby.org"
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

namespace :github do
  desc "Update Github Gemspec"
  task :update_gemspec do
    skip_fields = %w(new_platform original_platform)
    integer_fields = %w(specification_version)
    
    result = "Gem::Specification.new do |s|\n"
    spec.instance_variables.each do |ivar| 
      value = spec.instance_variable_get(ivar)
      name  = ivar.split("@").last
      next if skip_fields.include?(name) || value.nil? || value == "" || (value.respond_to?(:empty?) && value.empty?)
      if name == "dependencies"
        value.each do |d| 
          dep, *ver = d.to_s.split(" ")
          result <<  "  s.add_dependency #{dep.inspect}, #{ver.join(" ").inspect.gsub(/[()]/, "")}\n"
        end
      else
        case value
        when Array
          value =  name != "files" ? value.inspect : value.inspect.split(",").join(",\n")
        when String
          value = value.to_i if integer_fields.include?(name)
          value = value.inspect
        else
          value = value.to_s.inspect
        end
        result << "  s.#{name} = #{value}\n"
      end
    end
    result << "end"
    File.open(File.join(File.dirname(__FILE__), "#{spec.name}.gemspec"), "w"){|f| f << result}
  end
end