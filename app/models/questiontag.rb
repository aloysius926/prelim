# == Schema Information
#
# Table name: questiontags
#
#  id          :integer          not null, primary key
#  question_id :integer
#  tag_id      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

## Holds a record of which questions are finished
class Questiontag < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag
  validates_uniqueness_of :tag, scope: :question_id
end
