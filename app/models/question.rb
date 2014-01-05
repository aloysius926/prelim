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
  before_post_process :rename_question
  
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
  def rename_question
    extension = File.extname(pdf_file_name).downcase
    self.pdf.instance_write :file_name, "#{self.subject.name}_#{self.sittings.first}#{extension}"
  end
  def subj
    self.subject.name
  end
  def prof
    self.professor.name
  end
  def last_date
    @sittings =self.sittings.sort_by! {|u| u.year}
    @sittings.last
  end
end
