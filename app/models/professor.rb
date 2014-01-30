# == Schema Information
#
# Table name: professors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Professor < ActiveRecord::Base
	has_many :questions
end
