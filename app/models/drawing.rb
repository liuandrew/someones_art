class Drawing < ActiveRecord::Base
	validates :name, presence: true

	attr_accessible :image
	mount_uploader :image, ImageUploader
end
