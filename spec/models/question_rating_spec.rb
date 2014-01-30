# == Schema Information
#
# Table name: question_ratings
#
#  id          :integer          not null, primary key
#  uniqueness  :integer
#  difficulty  :integer
#  comment     :string(255)
#  user_id     :integer
#  overall     :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe QuestionRating do
  pending "add some examples to (or delete) #{__FILE__}"
end
