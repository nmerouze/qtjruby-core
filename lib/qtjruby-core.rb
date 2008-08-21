require 'java'

Dir.glob(ENV_JAVA['jruby.home'] + '/lib/qtjambi-*.jar') { |jar| require jar }
require 'qtjruby-core.jar'

require 'qtjruby-core/core_ext'
require 'qtjruby-core/qt'