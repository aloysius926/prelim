class SwitchSittingsKey < ActiveRecord::Migration
  def change
    add_reference :sittings, :question, index: true
    remove_column :questions, :sitting_id, :integer
  end
end
