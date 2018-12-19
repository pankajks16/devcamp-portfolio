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
								  allow_destroy: true,
								  reject_if: lambda { |attr| attr['name'].blank? }

	validates_presence_of :title, :body

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader

	scope :ruby_on_rails_items, -> { where(subtitle: "Ruby On Rails") }
	scope :by_position, -> { order('position ASC') }
	
	def self.angular_items
		where(subtitle: "Angular")
	end
end
