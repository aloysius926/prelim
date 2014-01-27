## Holds a record of which questions are finished
class Questiontag < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag
  validates_uniqueness_of :tag, scope: :question_id
end
