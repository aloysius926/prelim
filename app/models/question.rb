class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :source
  belongs_to :professor
  validates :source, :subject, presence: true
  has_many :sittings
  has_many :question_ratings
  has_many :answers
  has_many :finished_questions
  accepts_nested_attributes_for :sittings
  has_attached_file :pdf
  
  def total_answers
    self.answers.size
  end
  def overall
    QuestionRating.where(question_id: self.id).average(:overall)
  end
  def uniqueness
    QuestionRating.where(question_id: self.id).average(:uniqueness)
  end
  def difficulty
    QuestionRating.where(question_id: self.id).average(:difficulty)
  end
  
  def finished?(current_user)
    if self.finished_questions.where(user_id: current_user.id).exists?
      'Y'
    end
  end
  
end
