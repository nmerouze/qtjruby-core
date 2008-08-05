class Object
  # Extracts the singleton class, so that metaprogramming can be done on it.
  #
  # ==== Returns
  # Class:: The meta class.
  #
  # ==== Examples
  #   class MyString < String; end
  #
  #   MyString.instance_eval do
  #     define_method :foo do
  #       puts self
  #     end
  #   end
  #
  #   MyString.meta_class.instance_eval do
  #     define_method :bar do
  #       puts self
  #     end
  #   end
  #
  #   def String.add_meta_var(var)
  #     self.meta_class.instance_eval do
  #       define_method var do
  #         puts "HELLO"
  #       end
  #     end
  #   end
  #
  #   MyString.new("Hello").foo #=> "Hello"
  #   MyString.new("Hello").bar
  #     #=> NoMethodError: undefined method `bar' for "Hello":MyString
  #   MyString.foo
  #     #=> NoMethodError: undefined method `foo' for MyString:Class
  #   MyString.bar
  #     #=> MyString
  #   String.bar
  #     #=> NoMethodError: undefined method `bar' for String:Class
  #
  #   MyString.add_meta_var(:x)
  #   MyString.x #=> HELLO
  #
  # As you can see, using #meta_class allows you to execute code (and here,
  # define a method) on the metaclass itself. It also allows you to define
  # class methods that can be run on subclasses, and then be able to execute
  # code on the metaclass of the subclass (here MyString).
  #
  # In this case, we were able to define a class method (add_meta_var) on
  # String that was executable by the MyString subclass. It was then able to
  # define a method on the subclass by adding it to the MyString metaclass.
  #
  # For more information, you can check out _why's excellent article at:
  # http://whytheluckystiff.net/articles/seeingMetaclassesClearly.html
  def meta_class() class << self; self end end

  # ==== Returns
  # Boolean::
  #   True if the empty? is true or if the object responds to strip (e.g. a
  #   String) and strip.empty? is true, or if !self is true.
  #
  # ==== Examples
  #    [].blank?         #=>  true
  #    [1].blank?        #=>  false
  #    [nil].blank?      #=>  false
  #    nil.blank?        #=>  true
  #    true.blank?       #=>  false
  #    false.blank?      #=>  true
  #    "".blank?         #=>  true
  #    "     ".blank?    #=>  true
  #    " hey ho ".blank? #=>  false
  def blank?
    if respond_to?(:empty?) && respond_to?(:strip)
      empty? or strip.empty?
    elsif respond_to?(:empty?)
      empty?
    else
      !self
    end
  end

  # ==== Parameters
  # name<String>:: The name of the constant to get, e.g. "Merb::Router".
  #
  # ==== Returns
  # Object:: The constant corresponding to the name.
  def full_const_get(name)
    list = name.split("::")
    obj = Object
    list.each {|x| obj = obj.const_get(x) }
    obj
  end

  # Defines module from a string name (e.g. Foo::Bar::Baz)
  # If method already exists, no exception raised.
  #
  # ==== Parameters
  # name<String>:: The name of the full module name to make
  #
  # ==== Returns
  # nil
  def make_module(str)
    mod = str.split("::")
    start = mod.map {|x| "module #{x}"}.join("; ")
    ender = (["end"] * mod.size).join("; ")
    self.class_eval <<-HERE
      #{start}
      #{ender}
    HERE
  end
  
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
