class AccessController < ApplicationController

	before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

	def menu
		@username = session[:username]
		redirect_to(managements_path)
	end

	def login
	end

	def attempt_login
		if params[:towername].present? && params[:username].present? && params[:password].present?
			found_tower = Tower.where(:towername => params[:towername]).first
			if found_tower
				if found_user = Regular.where(:username => params[:username]).first
					authorized_user = found_user.authenticate(params[:password])
					if authorized_user
						session[:towername] = authorized_user.tower
						session[:user_id] = authorized_user.id
						session[:username] = authorized_user.username
						redirect_to(managements_path)
					else
						flash.now[:danger] = "Invalid username or password."
						render('login')
					end
				elsif found_user = Moderator.where(:username => params[:username]).first
					authorized_user = found_user.authenticate(params[:password])
					if authorized_user
						session[:towername] = authorized_user.tower
						session[:user_id] = authorized_user.id
						session[:username] = authorized_user.username
						redirect_to(managements_path)
					else
						flash.now[:danger] = "Invalid username or password."
						render('login')
					end
				elsif found_user = Administrator.where(:username => params[:username]).first
					authorized_user = found_user.authenticate(params[:password])
					if authorized_user
						session[:towername] = authorized_user.tower
						session[:user_id] = authorized_user.id
						session[:username] = authorized_user.username
						redirect_to(managements_path)
					else
						flash.now[:danger] = "Invalid username or password."
						render('login')
					end
				else
					flash.now[:danger] = "Invalid username or password."
					render('login')
				end
			else
				flash.now[:danger] = "Invalid towername."
				render('login')
			end
		end
	end

	def logout
		session[:towername] = nil
		session[:user_id] = nil
		session[:username] = nil
		flash[:success] = 'You are logged out.'
		redirect_to(access_login_path)
	end

end
