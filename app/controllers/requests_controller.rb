class RequestsController < ApplicationController
	before_action :authenticate_admin, except: [:index, :create]
	def index
		if(logged_in?)
			@requests = Request.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 25)
		else
			@requests = Request.where(verified: true).order(vote_total: :desc).paginate(:page => params[:page], :per_page => 25)
		end
		@new_request = Request.new
		@vote_cookies = retrieve_vote_cookies
	end

	# show maybe not required
	def show
		@request = Request.find(params[:id])
	end

	def new
		@request = Request.new
	end

	def create
		@request = Request.new(request_params)
		@request.vote_total = 0
		if @request.save
			flash[:success] = "Your request has been successfully saved!"
			redirect_to requests_path
		else
			flash[:failure] = "Your request had some issues with it."
			redirect_to requests_path
		end
	end

	def edit
		@request = Request.find(params[:id])
	end

	def update
		@request = Request.new(request_params)
	end

	def destroy
		Request.find(params[:id]).destroy
		flash[:success] = "Request has been deleted"
		redirect_to requests_path
	end

	# verification methods

	def verify
		Request.find(params[:request_id]).update(verified: true)
		redirect_to requests_path
	end

	def unverify
		Request.find(params[:request_id]).update(verified: false)
		redirect_to requests_path
	end

	private
		def request_params
			params.require(:request).permit(:title, :description, :verified)
		end

		def authenticate_admin
			redirect_to root_path unless logged_in?
		end
end
