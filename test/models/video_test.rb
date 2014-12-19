# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  youtube_id :string(255)
#  like       :integer
#  dislike    :integer
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
