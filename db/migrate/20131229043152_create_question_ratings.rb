class CreateQuestionRatings < ActiveRecord::Migration
  def change
    create_table :question_ratings do |t|
      t.integer :uniqueness
      t.integer :difficulty
      t.string :comment
      t.references :user, index: true
      t.integer :overall
      t.references :question, index: true

      t.timestamps
    end
  end
end
