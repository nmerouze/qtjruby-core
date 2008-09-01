require File.dirname(__FILE__) + '/spec_helper'

describe "Qt predifined constants" do
  it "should be inherited from com.trolltech.qt.core.Qt constants" do
    com.trolltech.qt.core.Qt.constants.each do |const_name|
      Qt.const_get(const_name).should == com.trolltech.qt.core.Qt.const_get(const_name)
    end
  end
end