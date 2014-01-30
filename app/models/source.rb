# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  source     :text
#  created_at :datetime
#  updated_at :datetime
#

class Source < ActiveRecord::Base
end
