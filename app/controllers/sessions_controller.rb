class SessionsController < ApplicationController
  def new
  end

  def create
  	admin_password = BCrypt::Password.new(APP_ADMIN['password_hash'])
  	if admin_password == APP_ADMIN['salt'] + params[:session][:password] 
  		flash[:success] = "Admin logged in!"
  		login
  		redirect_to root_path
		else
			flash.now[:failure] = "Incorrect Password"
			render 'new'
		end
	end

	def destroy
    logout
    redirect_to root_path
	end
end
