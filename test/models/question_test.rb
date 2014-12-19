# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  username   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
