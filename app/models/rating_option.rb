# == Schema Information
#
# Table name: rating_options
#
#  id    :integer          not null, primary key
#  label :string(255)
#  value :integer
#

class RatingOption < ActiveRecord::Base
end
