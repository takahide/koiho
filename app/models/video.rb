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

class Video < ActiveRecord::Base
  def comments
    Comment.where video_id: self.id
  end
end
