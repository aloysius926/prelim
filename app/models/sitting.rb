### Sitting Model
class Sitting < ActiveRecord::Base
  belongs_to :term
  belongs_to :question
  validates :number, presence: true
  has_one :subject, through: :question
  def print_sitting
    if term.term == 'Fall'
      "Q#{number}F#{year}"
    else
      "Q#{number}S#{year}"
    end
  end

  def sort_sitting
    if term.term == 'Fall'
      "#{year}F#{number}"
    else
      "#{year}S#{number}"
    end
  end

  def self.table_sittings
    Sitting.joins(:question, :subject, :term)
           .select('number, year, terms.term, subjects.name,
                    question_id, term_id, questions.subject_id')
           .order('subject_id, year DESC, terms.term, number')
  end

  def compare_print
    "#{subject_id}#{year}#{term.term}#{number}"
  end
end
