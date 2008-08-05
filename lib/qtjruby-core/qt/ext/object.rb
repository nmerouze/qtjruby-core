module Qt
  module Ext
    module Object
      
      def self.included(base)
        base.class_eval do
          def self.connect(signal, slot, &block)
            klass = Java::JavaClass.for_name("org.qtjruby.Signals").ruby_class

            if block_given?
              klass.connect(signal, slot, block)
            else
              klass.connect(signal, slot)
            end
          end
        end
      end
      
    end
  end
end