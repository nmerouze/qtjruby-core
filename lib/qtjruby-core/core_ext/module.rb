class Module
  # Defines module-level attribute reader.
  #
  # ==== Parameters
  # *syms<Array>:: Array of attributes to define reader for.
  def mattr_reader(*syms)
    syms.flatten.each do |sym|
      next if sym.is_a?(Hash)
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}
          @@#{sym} = nil
        end

        def self.#{sym}
          @@#{sym}
        end
      EOS
    end
  end

  # Defines module-level attribute writer.
  #
  # ==== Parameters
  # *syms<Array>:: Array of attributes to define writer for.
  #
  def mattr_writer(*syms)
    options = syms.last.is_a?(Hash) ? syms.pop : {}
    syms.flatten.each do |sym|
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}
          @@#{sym} = nil
        end

        def self.#{sym}=(obj)
          @@#{sym} = obj
        end
      EOS
    end
  end

  # Defines module-level attribute accessor.
  #
  # ==== Parameters
  # *syms<Array>:: Array of attributes to define accessor for.
  #
  def mattr_accessor(*syms)
    mattr_reader(*syms)
    mattr_writer(*syms)
  end
end