# == Schema Information
#
# Table name: question_ratings
#
#  id          :integer          not null, primary key
#  uniqueness  :integer
#  difficulty  :integer
#  comment     :string(255)
#  user_id     :integer
#  overall     :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_rating do
    uniqueness 1
    difficulty 1
    comment "MyString"
    user nil
    overall 1
  end
end
