class VotesController < ApplicationController
	def create
		request = Request.find(params[:request_id])
		request.votes.create!(:value => params[:value])
		redirect_to requests_path
	end

	def destroy

	end
end
