class AddRatingsToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :overall, :float, :default => 3
    add_column :questions, :difficulty, :float, :default => 3
    add_column :questions, :uniqueness, :float, :default => 3
    
    Question.reset_column_information
    Question.all.each do |question|
      @ratings = QuestionRating.where(question_id: question.id)
      question.overall = @ratings.average(:overall)
      question.difficulty = @ratings.average(:difficulty)
      question.uniqueness = @ratings.average(:uniqueness)
      question.save!
    end
      
  end
  def self.down
    remove_column :questions, :overall, :float
    remove_column :questions, :difficulty, :float
    remove_column :questions, :uniqueness, :float
  end
end
