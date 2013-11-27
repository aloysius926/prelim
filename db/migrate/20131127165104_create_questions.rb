class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :subject, index: true
      t.references :term, index: true
      t.references :source, index: true
      t.references :professor, index: true
      t.integer :year
      t.string :number
      t.integer :mini

      t.timestamps
    end
  end
end
