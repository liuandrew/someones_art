class RequestController < ApplicationController
	def index
		@requests = Request.all
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
	end

	def edit
		@request = Request.find(params[:id])
	end

	def update
		@request = Request.new(request_params)
	end

	def destroy
	end

	private
		def request_params
			params.require(:request).permit(:title, :description)
		end
end
