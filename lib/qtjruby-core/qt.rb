dir = Pathname(__FILE__).dirname.expand_path / 'qt'

require dir / 'ext' / 'application'
require dir / 'ext' / 'object'

class Object
  # ==== Parameters
  # name<String>:: The name of the class to get without the prefix, e.g. "Widget" for "QWidget".
  #
  # ==== Returns
  # Java::JavaClass:: The Java class corresponding to the name.
  def full_class_get(name)
    qt = ['com', 'trolltech', 'qt']
    packages = [nil, 'gui', 'core', 'webkit', 'phonon', 'svg', 'opengl']

    packages.each do |package|
      full_name = (qt + [package, "Q#{name}"]).compact.join('.')
      begin
        return Java::JavaClass.for_name(full_name)
      rescue NameError
        next
      end
    end
    
    packages.each do |package|
      full_name = (qt + [package, name]).compact.join('.')
      begin
        return Java::JavaClass.for_name(full_name)
      rescue NameError
        next
      end
    end
  end
end

module Qt
  # Create Signal classes
  0.upto(9) do |i|
    klass = Class.new(Java::JavaClass.for_name("org.qtjruby.Signal#{i}").ruby_class)
    const_set("Signal#{i}", klass)
  end
  
  # Set all Qt constants to Ruby Qt module because const_missing can't do this work.
  com.trolltech.qt.core.Qt.constants.each do |const_name|
    const_set(const_name, com.trolltech.qt.core.Qt.const_get(const_name))
  end
  
  class << self
    
    # Search the Java package where the class is and create a related Ruby class.
    #
    # ==== Parameters
    # name<String>:: The name of the class to search without the prefix, e.g. "Widget" for "QWidget".
    #
    # ==== Returns
    # Class:: The Ruby class of the searched Java class.
    def const_missing(name)
      java_klass = full_class_get(name)
      klass = Class.new(java_klass.ruby_class)

      klass.class_eval do
        @@java_klass = java_klass
        include Qt::Ext.const_get(name) if Qt::Ext.const_defined?(name)

        def initialize(*args)
          super(*args)
          @source = self.clone

          @@java_klass.fields.each do |field|
            meta_class.class_eval %{
              def #{field.name}(*args, &block)
                Qt::Object.connect(@source.#{field.name}, self.method('slot'), &block)
              end
              alias :#{field.name.snake_case} :#{field.name}
            } if field.type.to_s =~ /QSignalEmitter/
          end
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