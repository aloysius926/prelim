class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_attached_file :pdf
end
