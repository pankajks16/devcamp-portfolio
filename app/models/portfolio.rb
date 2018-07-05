# == Schema Information
#
# Table name: portfolios
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  subtitle    :string
#  body        :text
#  main_image  :text
#  thumb_image :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	scope :ruby_on_rails_items, -> { where(subtitle: "Ruby On Rails") }

	def self.angular_items
		where(subtitle: "Angular")
	end

	# def self.ror
	# 	where(subtitle: "Ruby On Rails")
	# end


end
