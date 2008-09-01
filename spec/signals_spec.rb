require File.dirname(__FILE__) + '/spec_helper'

describe "Qt::Signal classes" do
  it "should be inherited from org.qtjruby.Signal classes" do
    0.upto(9) do |i|
      Qt.const_get("Signal#{i}").superclass.java_class.should == Java::JavaClass.for_name("org.qtjruby.Signal#{i}")
    end
  end
end