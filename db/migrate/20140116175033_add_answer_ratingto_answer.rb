class AddAnswerRatingtoAnswer < ActiveRecord::Migration
  def self.up
    add_column :answers, :overall, :float
    add_column :answers, :clarity, :float
    add_column :answers, :correctness, :float
    add_column :answers, :detail, :float
    
    Answer.reset_column_information
    Answer.all.each do |answer|
      @ratings = AnswerRating.where(answer_id: answer.id)
      answer.overall = @ratings.average(:overall)
      answer.clarity = @ratings.average(:clarity)
      answer.correctness = @ratings.average(:correctness)
      answer.detail = @ratings.average(:detail)
      answer.save!
    end
  end
  def self.down
    remove_column :answers, :overall, :float
    remove_column :answers, :clarity, :float
    remove_column :answers, :correctness, :float
    remove_column :answers, :detail, :float
  end
end
