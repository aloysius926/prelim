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
