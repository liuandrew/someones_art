class StaticPagesController < ApplicationController
	
	def home
		render :layout => false
	end

	def contact
	end

	def about
	end
end
