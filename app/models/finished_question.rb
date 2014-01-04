class FinishedQuestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates_uniqueness_of :question_id, :scope => :user_id
  
end
