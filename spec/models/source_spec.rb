require 'spec_helper'

describe Source do
  it "has a valid factory" do
    FactoryGirl.create(:source).should be_valid
  end
end
