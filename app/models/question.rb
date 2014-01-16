class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :source
  belongs_to :professor
  validates :source, :subject, presence: true
  has_many :sittings, dependent: :destroy
  has_many :question_ratings, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :finished_questions, dependent: :destroy
  has_many :tags, :through => :questiontags
  has_many :terms, :through => :sittings
  has_many :questiontags, dependent: :destroy
  accepts_nested_attributes_for :sittings
  has_attached_file :pdf
  after_create :update_question_ratings
  
  def update_question_ratings
    @ratings = QuestionRating.where(question_id: self.id)
    self.overall = @ratings.average(:overall)
    self.difficulty = @ratings.average(:difficulty)
    self.uniqueness = @ratings.average(:uniqueness)
    self.save!
  end
  
  def subj
    self.subject.name
  end
  def prof
    self.professor.name
  end
  def last_date
    @sittings =self.sittings.sort_by {|u| u.year}
    @sitting = @sittings.last
    @sitting.sort_sitting
  end
end
