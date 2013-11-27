class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.text :source

      t.timestamps
    end
  end
end
