class AddSittingToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :sitting, index: true
  end
end
