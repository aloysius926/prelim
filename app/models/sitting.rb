class Sitting < ActiveRecord::Base
  belongs_to :term
  belongs_to :question
end
