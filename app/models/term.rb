# == Schema Information
#
# Table name: terms
#
#  id         :integer          not null, primary key
#  term       :text
#  created_at :datetime
#  updated_at :datetime
#

class Term < ActiveRecord::Base
end
