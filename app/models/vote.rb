class Vote < ActiveRecord::Base
	belongs_to :request
	validates :value, presence: true
	validates :request_id, presence: true
end
