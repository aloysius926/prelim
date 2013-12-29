class CreateAnswerRatings < ActiveRecord::Migration
  def change
    create_table :answer_ratings do |t|
      t.references :user, index: true
      t.references :answer, index: true
      t.integer :overall
      t.integer :clarity
      t.integer :detail
      t.integer :correctness

      t.timestamps
    end
  end
end
