class CreateFinishedQuestions < ActiveRecord::Migration
  def change
    create_table :finished_questions do |t|
      t.references :user, index: true
      t.references :question, index: true
      t.boolean :finished

      t.timestamps
    end
  end
end
