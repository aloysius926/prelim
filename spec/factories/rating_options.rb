# == Schema Information
#
# Table name: rating_options
#
#  id    :integer          not null, primary key
#  label :string(255)
#  value :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating_option do
  end
end
