module Placeholder
	extend ActiveSupport::Concern

	def self.image_generator(height:, width:)				# colon is used to make a strict call to the parameter
		"http://via.placeholder.com/#{height}x#{width}"		# Using : we need specify the parameter name as well.
	end
end