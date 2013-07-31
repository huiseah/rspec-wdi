# == Schema Information
#
# Table name: stairs
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Stair < ActiveRecord::Base
	has_many :fruits
end
