class AccessController < ApplicationController

	before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

	def menu
		@username = session[:username]
		redirect_to(admin_users_path)
	end

	def login
	end

	def attempt_login
		if params[:username].present? && params[:password].present?
			found_user = AdminUser.where(:username => params[:username]).first
			if found_user
				authorized_user = found_user.authenticate(params[:password])
			end
		end

		if authorized_user
			session[:user_id] = authorized_user.id
			session[:username] = authorized_user.username
			if found_user.superuser?
				redirect_to(admin_path)
			else
				if (found_user.score == -1)
					redirect_to(edit_exam_path(session[:user_id]))
				else
					redirect_to(exams_path)
				end
			end
		else
			flash.now[:danger] = "Invalid username or password."
			render('login')
		end
	end

	def logout
		session[:user_id] = nil
		session[:username] = nil
		flash[:success] = 'You are logged out.'
		redirect_to(access_login_path)
	end

end
