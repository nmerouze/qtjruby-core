dir = Pathname(__FILE__).dirname.expand_path / 'qt'

require dir / 'ext' / 'application'
require dir / 'ext' / 'object'

module Qt
  include com.trolltech.qt.core.Qt
  include_package 'org.qtjruby'
  
  class JambiClass
    include_package 'com.trolltech.qt.core'
    include_package 'com.trolltech.qt.gui'
    include_package 'com.trolltech.qt.webkit'
    include_package 'com.trolltech.qt.phonon'
    include_package 'com.trolltech.qt'
    include_package 'com.trolltech.qt.svg'
    include_package 'com.trolltech.qt.opengl'
    
    def self.for_name(name)
      const_get("Q#{name}"); rescue NameError; const_get(name)
    end
  end
  
  class << self
    # Create a Qt::JRuby class from a Qt Jambi class.
    #
    # ==== Parameters
    # name<String>:: The name of the class to create.
    #
    # ==== Returns
    # Class:: The newly created Qt::JRuby class.
    def const_missing(name)
      klass = Class.new(Qt::JambiClass.for_name(name))
      
      klass.class_eval do
        include Qt::Ext.const_get(name) if Qt::Ext.const_defined?(name)

        self.superclass.java_class.fields.each do |field|
          self.class_eval %{
            alias :old_#{field.name} :#{field.name}

            def #{field.name}(*args, &block)
              Qt::Object.connect(self.old_#{field.name}, self.method('slot'), &block)
            end

            alias :#{field.name.snake_case} :#{field.name}
          } if field.type.to_s =~ /QSignalEmitter/
        end

        protected

          def slot(*args, &block)
            block.call(*args) if block_given?
          end
      end

      const_set(name, klass)
    end
  end
  
end