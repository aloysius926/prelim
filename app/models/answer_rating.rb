# Tracks answer Ratings
class AnswerRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  has_many :answer_ratings, dependent: :destroy
  validates_uniqueness_of :answer_id, :scope => :user_id
end
