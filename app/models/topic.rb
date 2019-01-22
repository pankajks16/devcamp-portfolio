# == Schema Information
#
# Table name: topics
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
	has_many :blogs
	validates_presence_of :title

	scope :has_blogs, -> { includes(:blogs).where.not(blogs: { id: nil }) }
end