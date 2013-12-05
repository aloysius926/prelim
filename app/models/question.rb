class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :term
  belongs_to :source
  belongs_to :professor
  has_attached_file :pdf
end
