class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	private
	
	def confirm_logged_in
		unless session[:user_id]
			redirect_to(access_login_path)
		end
	end

	def is_administrator
		unless session[:username] == "admin"
			redirect_to(access_logout_path)
		end
	end

	def is_moderator
		unless session[:usertype] == "moderator"
			redirect_to(access_logout_path)
		end
	end
	
	def is_not_regular
		if session[:usertype] == "regular"
			redirect_to(access_logout_path)
		end
	end

	def is_regular
		if session[:usertype] != "regular"
			redirect_to(access_logout_path)
		end
	end

end
