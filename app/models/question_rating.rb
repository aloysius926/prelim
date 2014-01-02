class QuestionRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :overall, :user, :question, presence: true
  validates_uniqueness_of :question_id, :scope => :user_id
end
