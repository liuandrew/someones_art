class Request < ActiveRecord::Base
	validates :title, presence: true
	has_many :votes, dependent: :destroy
end
