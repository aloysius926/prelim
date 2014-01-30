# == Schema Information
#
# Table name: answers
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  question_id      :integer
#  pdf_file_name    :string(255)
#  pdf_content_type :string(255)
#  pdf_file_size    :integer
#  pdf_updated_at   :datetime
#  created_at       :datetime
#  updated_at       :datetime
#  typed            :boolean          default(FALSE)
#  overall          :float
#  clarity          :float
#  correctness      :float
#  detail           :float
#

require 'spec_helper'

describe Answer do
  pending "add some examples to (or delete) #{__FILE__}"
end
