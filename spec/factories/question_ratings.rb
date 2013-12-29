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
