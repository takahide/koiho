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

class Question < ActiveRecord::Base
end
