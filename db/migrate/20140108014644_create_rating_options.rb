class CreateRatingOptions < ActiveRecord::Migration
  def change
    create_table :rating_options do |t|
      t.string :label
      t.integer :value
    end
  end
end
