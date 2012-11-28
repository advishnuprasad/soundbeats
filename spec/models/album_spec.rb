require 'spec_helper'

describe Album do
  
  it "should have a name" do
    album = FactoryGirl.build(:album, :name => nil)
    album.should_not be_valid
  end

end
