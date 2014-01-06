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
  has_many :questiontags, dependent: :destroy
  accepts_nested_attributes_for :sittings
  has_attached_file :pdf
  
  def self.fill_cell(yr,term,number,uid,subject)
    term_id = Term.where("term = :term", term: term).first.id
    @finished = FinishedQuestion.where("user_id = :user",user: uid).pluck(:question_id)
    @sitting = Sitting.where("year=:yr AND term_id=:term AND number=:number",yr: yr,term: term_id,number: number).pluck(:question_id) 
    if @sitting != "NULL"
      @questions = Question.where("id is :qid AND subject_id = :subject",qid: @sitting, subject: subject)
    end
    if @questions.size==0 
      ""
    else
      if @finished.include?(@questions.first.id)
	"   X"
      else
	"   --"
      end
    end
  end
  
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
