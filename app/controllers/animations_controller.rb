class AnimationsController < ApplicationController
	before_action :authenticate_admin, except: [:index, :show]

	def index
		@animations = Animation.all
	end

	def show
		@animation = Animation.find(params[:id])
	end

	def new
		@animation = Animation.new
	end

	def create
		@animation = Animation.new(drawing_params)
		if @animation.save
			flash[:success] = "Animation successfully saved!"
			redirect_to @animation
		else
			flash.now[:failure] = "Some fields are missing."
			render 'new'
		end
	end

	def edit
		@animation = Animation.find(params[:id])
	end

	def update
		@animation = Animation.find(params[:id])
		if @animation.update_attributes(drawing_params)
			flash[:success] = "Animation successfully edited!"
			redirect_to @animation
		else
			flash.now[:failure] = "Some fields are incomplete"
			render 'edit'
		end
	end

	def destroy

	end

	private
		def animation_params
			params.require(:animation).permit(:name, :description, :video, :cloudinary_url)
		end

		def authenticate_admin
			redirect_to root_path unless logged_in?
		end
end
