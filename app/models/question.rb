class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :source
  belongs_to :professor
  has_many :sittings, :dependent => :destroy
  accepts_nested_attributes_for :sittings, :allow_destroy => true
  has_attached_file :pdf
end
