# == Schema Information
#
# Table name: finished_questions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  finished    :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :finished_question do
    user nil
    question nil
    finished false
  end
end
