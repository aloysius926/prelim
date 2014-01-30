# == Schema Information
#
# Table name: answers
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  question_id      :integer
#  pdf_file_name    :string(255)
#  pdf_content_type :string(255)
#  pdf_file_size    :integer
#  pdf_updated_at   :datetime
#  created_at       :datetime
#  updated_at       :datetime
#  typed            :boolean          default(FALSE)
#  overall          :float
#  clarity          :float
#  correctness      :float
#  detail           :float
#

### Holds information related to answers of questions
class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, counter_cache: true
  has_one :subject, through: :question
  has_many :answer_ratings
  has_attached_file :pdf
  after_create :update_answer_ratings

  def update_answer_ratings
    @ratings = AnswerRating.where(answer_id: id)
    self.overall = @ratings.average(:overall)
    self.clarity = @ratings.average(:clarity)
    self.detail = @ratings.average(:detail)
    self.correctness = @ratings.average(:correctness)
    self.save!
  end

  def self.attributes_to_ignore_when_comparing
    [:id, :created_at, :updated_at, :pdf_updated_at]
  end

  def identical?(other)
    attributes.except(*self.class
         .attributes_to_ignore_when_comparing.map(&:to_s)) ==
    other.attributes.except(*self.class
         .attributes_to_ignore_when_comparing.map(&:to_s))
  end
end
