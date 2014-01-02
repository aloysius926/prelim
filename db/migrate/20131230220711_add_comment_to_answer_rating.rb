class AddCommentToAnswerRating < ActiveRecord::Migration
  def change
    add_column :answer_ratings, :comment, :string
  end
end
