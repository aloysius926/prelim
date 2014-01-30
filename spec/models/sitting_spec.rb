# == Schema Information
#
# Table name: sittings
#
#  id          :integer          not null, primary key
#  term_id     :integer
#  year        :integer
#  number      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  question_id :integer
#

require 'spec_helper'

describe Sitting do
  pending "add some examples to (or delete) #{__FILE__}"
end
