# == Schema Information
#
# Table name: answer_ratings
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  answer_id   :integer
#  overall     :integer
#  clarity     :integer
#  detail      :integer
#  correctness :integer
#  created_at  :datetime
#  updated_at  :datetime
#  comment     :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer_rating do
    user nil
    answer nil
    overall 1
    clarity 1
    detail 1
    correctness 1
  end
end
