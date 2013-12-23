class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :source
  belongs_to :professor
  has_many :sittings
  accepts_nested_attributes_for :sittings
  has_attached_file :pdf
end
