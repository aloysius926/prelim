# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  source     :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Source do
  it "has a valid factory" do
    FactoryGirl.create(:source).should be_valid
  end
end
