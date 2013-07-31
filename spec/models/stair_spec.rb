# == Schema Information
#
# Table name: stairs
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Stair do
  it { should have_many :fruits }
end
