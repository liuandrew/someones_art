class Drawing < ActiveRecord::Base
	validates :name, presence: true
	validates :image_url, presence: true
end
