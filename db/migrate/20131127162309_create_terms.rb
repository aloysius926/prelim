class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.text :term

      t.timestamps
    end
  end
end
