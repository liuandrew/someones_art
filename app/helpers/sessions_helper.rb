module SessionsHelper
	def login
		session[:admin_id] = APP_ADMIN['admin_id']
	end 

	def password_digest(string)
		salt = APP_ADMIN['salt']
		BCrypt::Password.create(string)
	end

	def logged_in?
		session[:admin_id] == APP_ADMIN['admin_id']
	end

	def logout
		session.delete(:admin_id)
	end
end
