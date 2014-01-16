class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, :counter_cache => true
  has_many :answer_ratings
  has_attached_file :pdf
  after_create :update_answer_ratings
   
  def update_answer_ratings
    @ratings = AnswerRating.where(answer_id: self.id)
    self.overall = @ratings.average(:overall)
    self.clarity = @ratings.average(:clarity)
    self.detail = @ratings.average(:detail)
    self.correctness = @ratings.average(:correctness)
    self.save!
  end
end
