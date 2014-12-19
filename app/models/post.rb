# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  username   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
end
