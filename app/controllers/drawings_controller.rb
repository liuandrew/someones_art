class DrawingsController < ApplicationController
	include DrawingsHelper

	def index
		@drawings = Drawing.all		
	end

	def show
		@drawing = Drawing.find(params[:id])
	end

	def new
		@drawing = Drawing.new
	end

	def create
		@drawing = Drawing.new(drawing_params)
		if @drawing.save
			flash[:success] = "Drawing successfully saved!"
			redirect_to @drawing
		else
			flash.now[:failure] = "Some fields are missing."
			render 'new'
		end
	end

	def edit
		@drawing = Drawing.find(params[:id])
	end

	def update
		@drawing = Drawing.find(params[:id])
		if @drawing.update_attributes(drawing_params)
			flash[:success] = "Drawing successfully edited!"
			redirect_to @drawing
		else
			flash.now[:failure] = "Some fields are incomplete"
			render 'edit'
		end
	end

	private
		def drawing_params
			params.require(:drawing).permit(:name, :description, :image_url)
		end

end