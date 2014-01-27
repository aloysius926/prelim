class FinishedQuestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates_uniqueness_of :question_id, :scope => :user_id

  def self.user_finished(id)
  	where('user_id = :user AND finished = TRUE', user: id)
    .pluck(:question_id)
  end

end
