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
#  position    :integer
#

class Portfolio < ApplicationRecord
	has_many :technologies, dependent: :destroy   

	# dependent: :destroy allows us to delete the associated records(techonologies), else the error would pop up like:
	# ActiveRecord::InvalidForeignKey (PG::ForeignKeyViolation: ERROR:  update or delete on table "portfolios" violates 
	# foreign key constraint "fk_rails_cc5ab4a1c3" on table "technologies"
	# DETAIL:  Key (id)=(11) is still referenced from table "technologies"

	accepts_nested_attributes_for :technologies, 
								  reject_if: lambda { |attr| attr['name'].blank? }

	include Placeholder
	validates_presence_of :title, :body, :main_image, :thumb_image

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader

	scope :ruby_on_rails_items, -> { where(subtitle: "Ruby On Rails") }
	scope :by_position, -> { order('position ASC') }
	after_initialize :set_defaults	# This is a call back at the time of new action. 
									# NEW action is the intialization phase.

	def self.angular_items
		where(subtitle: "Angular")
	end

	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: 600, width: 400)
		self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
		
		# self.main_image ||= "http://via.placeholder.com/600x400"
		# self.thumb_image ||= "http://via.placeholder.com/350x200"

		# The above code is equivalent to:
		
		# if self.main_image == nil
		# 	self.main_image = "http://via.placeholder.com/600x400"
		# end

		# So the above condition is equal to the ||= operator which means that apply the
		# value on RHS only if the LHS value is absent or nil else use the existing value.
	end

	# def self.ror
	# 	where(subtitle: "Ruby On Rails")
	# end
end
