# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  video_id   :integer
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Comment < ActiveRecord::Base
end
