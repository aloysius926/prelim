class RemoveTimeFromQuestions < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.remove :year, :term_id, :number
    end
  end
end
