# == Schema Information
#
# Table name: answer_ratings
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  answer_id   :integer
#  overall     :integer
#  clarity     :integer
#  detail      :integer
#  correctness :integer
#  created_at  :datetime
#  updated_at  :datetime
#  comment     :string(255)
#

# Tracks answer Ratings
class AnswerRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  has_many :answer_ratings, dependent: :destroy
  validates_uniqueness_of :answer_id, :scope => :user_id
end
