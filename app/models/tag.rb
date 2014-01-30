# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tag        :text
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  belongs_to :question
  validates_uniqueness_of :tag
  has_many :questiontags
  has_many :questions, :through => :questiontags
end
