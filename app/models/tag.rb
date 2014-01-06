class Tag < ActiveRecord::Base
  belongs_to :question
  validates_uniqueness_of :tag
  has_many :questiontags
  has_many :questions, :through => :questiontags
end
