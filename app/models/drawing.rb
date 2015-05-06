class Drawing < ActiveRecord::Base
	validates :name, presence: true

	attr_accessor :image
	mount_uploader :image, ImageUploader
end
