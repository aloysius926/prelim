require 'spec_helper'

describe Question do
  it "has a valid factory" do
    FactoryGirl.create(:question).should be_valid
  end
  it "is invalid without a source" do
    FactoryGirl.build(:question, source_id: nil).should_not be_valid
  end
  it "is invalid without a subject" do
    FactoryGirl.build(:question, subject_id: nil).should_not be_valid
  end
end
