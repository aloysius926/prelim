class CreateSittings < ActiveRecord::Migration
  def change
    create_table :sittings do |t|
      t.references :term, index: true
      t.integer :year
      t.string :number

      t.timestamps
    end
  end
end
