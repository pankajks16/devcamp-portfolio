# == Schema Information
#
# Table name: skills
#
#  id               :bigint(8)        not null, primary key
#  title            :string
#  percent_utilized :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  badge            :text
#

class Skill < ApplicationRecord
	validates_presence_of :title, :percent_utilized
end
