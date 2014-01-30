# == Schema Information
#
# Table name: answer_ratings
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  answer_id   :integer
#  overall     :integer
#  clarity     :integer
#  detail      :integer
#  correctness :integer
#  created_at  :datetime
#  updated_at  :datetime
#  comment     :string(255)
#

require 'spec_helper'

describe AnswerRating do
  pending "add some examples to (or delete) #{__FILE__}"
end
