class Animation < ActiveRecord::Base
	validates :name, presence: true
	validates :youtube_id, presence: true
	
end
