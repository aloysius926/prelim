class AddTypedtoAnswers < ActiveRecord::Migration
  def change
     add_column :answers, :typed, :boolean, :default => false
  end
end
