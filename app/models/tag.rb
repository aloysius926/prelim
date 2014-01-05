class Tag < ActiveRecord::Base
  belongs_to :question
  
  has_many :questiontags
  has_many :questions, :through => :questiontags
end
