class Sitting < ActiveRecord::Base
  belongs_to :term
  belongs_to :question
  validates :number, presence: true
  def print_sitting
    if term.term=="Fall"
      "Q#{number}F#{year}"
    else
      "Q#{number}S#{year}"
    end
  end
end
