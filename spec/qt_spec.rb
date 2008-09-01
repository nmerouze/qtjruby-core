require File.dirname(__FILE__) + '/spec_helper'

describe Qt do
  it "should include Signal classes" do
    0.upto(9) do |i|
      Qt.const_defined?("Signal#{i}").should be_true
    end
  end
  
  it "should include com.trolltech.qt.core.Qt constants" do
    com.trolltech.qt.core.Qt.constants.each do |const_name|
      Qt.const_defined?(const_name).should be_true
    end
  end
end