# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  subject_id       :integer
#  source_id        :integer
#  professor_id     :integer
#  mini             :integer
#  created_at       :datetime
#  updated_at       :datetime
#  pdf_file_name    :string(255)
#  pdf_content_type :string(255)
#  pdf_file_size    :integer
#  pdf_updated_at   :datetime
#  answers_count    :integer          default(0)
#  overall          :float            default(3.0)
#  difficulty       :float            default(3.0)
#  uniqueness       :float            default(3.0)
#

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
