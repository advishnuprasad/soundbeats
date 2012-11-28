require 'spec_helper'

describe Artist do

  it "should have a name" do
    artist = FactoryGirl.build(:artist, :name => nil)
    artist.should_not be_valid
  end

end
