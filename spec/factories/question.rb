require 'faker'

FactoryGirl.define do
  factory :question do 
    association :subject
    association :source
    association :professor 
    mini "1"
  end
end