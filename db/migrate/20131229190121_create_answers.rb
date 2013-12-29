class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user, index: true
      t.references :question, index: true
      t.attachment :pdf

      t.timestamps
    end
  end
end
