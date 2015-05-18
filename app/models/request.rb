class Request < ActiveRecord::Base
	validates :title, presence: true
end
