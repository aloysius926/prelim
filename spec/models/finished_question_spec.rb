# == Schema Information
#
# Table name: finished_questions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  finished    :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe FinishedQuestion do
  pending "add some examples to (or delete) #{__FILE__}"
end
