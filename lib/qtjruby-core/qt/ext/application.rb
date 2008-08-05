module Qt
  module Ext
    module Application
      
      def self.included(base)
        base.class_eval do
          def self.initialize(args)
            org.qtjruby.QApplication.init(args.to_java(:string))
          end
        end
      end
      
    end
  end
end