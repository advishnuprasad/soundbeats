require 'spec_helper'

describe User do
  it "should be invalid without an email" do
    user = FactoryGirl.build(:user, :email => nil)
    user.should_not be_valid
  end
end
