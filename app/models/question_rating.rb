# == Schema Information
#
# Table name: question_ratings
#
#  id          :integer          not null, primary key
#  uniqueness  :integer
#  difficulty  :integer
#  comment     :string(255)
#  user_id     :integer
#  overall     :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class QuestionRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :overall, :user, :question, presence: true
  validates_uniqueness_of :question_id, :scope => :user_id
  after_create :update_question_rating
  
  def update_question_rating
    question.update_question_ratings
  end
end
