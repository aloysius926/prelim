# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :finished_question do
    user nil
    question nil
    finished false
  end
end
