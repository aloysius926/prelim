class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :answer_ratings
  has_attached_file :pdf
  
  def overall
    AnswerRating.where(answer_id: self.id).average(:overall)
  end
  def clarity
    AnswerRating.where(answer_id: self.id).average(:clarity)
  end
  def detail
    AnswerRating.where(answer_id: self.id).average(:detail)
  end
  def correctness
    AnswerRating.where(answer_id: self.id).average(:correctness)
  end  
end
