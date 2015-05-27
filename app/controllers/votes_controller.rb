class VotesController < ApplicationController
	def create
		request = Request.find(params[:request_id])
		vote = request.votes.build(:value => params[:value])
		vote.save
		give_vote_cookie(params[:request_id], params[:value], vote.id)

		update_vote_total(params[:request_id])

		respond_to do |format|
			format.html {redirect_to requests_path}
			format.js
		end
	end

	def destroy
		@vote = Vote.find(params[:id]).delete
		delete_vote_cookie(params[:id])

		update_vote_total(@vote.request_id)

		respond_to do |format|
			format.html {redirect_to requests_path}
			format.js
		end
	end

	def update_vote_total(request_id)
		total_votes = Vote.where("request_id = '#{request_id}'").sum("value")
		request = Request.find(request_id)
		request.update(vote_total: total_votes)
	end
end
