class AccessController < ApplicationController

	before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

	def menu
		@username = session[:username]
		redirect_to(managements_path)
	end

	def login
		# reders login template
	end

	def attempt_login
		if params[:towername].present? && params[:username].present? && params[:password].present?
			found_tower = Tower.where(:towername => params[:towername]).first
			if found_tower
				if params[:username] == "admin"
					authorized_user = found_tower.authenticate(params[:password])
					if authorized_user
						session[:tower_id] = authorized_user.id
						session[:user_id] = authorized_user.id
						session[:username] = "admin"
						session[:usertype] = "admin"
						redirect_to(managements_path)
					else
						flash.now[:danger] = "Invalid username or password."
						render('login')
					end
				elsif  found_user = Regular.where(:username => params[:username]).first
					authorized_user = found_user.authenticate(params[:password])
					if authorized_user
						if(authorized_user.floor.tower.towername == params[:towername])
							session[:tower_id] = authorized_user.floor.tower.id
							session[:floor_id] = authorized_user.floor.id
							session[:user_id] = authorized_user.id
							session[:username] = authorized_user.username
							session[:usertype] = "regular"
							redirect_to(home_index_path)
						else
							flash.now[:danger] = "Invalid username or password."
						render('login')
						end
					else
						flash.now[:danger] = "Invalid username or password."
						render('login')
					end
				elsif found_user = Moderator.where(:username => params[:username]).first
					authorized_user = found_user.authenticate(params[:password])
					if authorized_user
						if(authorized_user.tower.towername == params[:towername])
							session[:tower_id] = authorized_user.tower.id
							session[:user_id] = authorized_user.id
							session[:username] = authorized_user.username
							session[:usertype] = "moderator"
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
		session[:tower_id] = nil
		session[:user_id] = nil
		session[:username] = nil
		session[:usertype] = nil
		flash[:success] = 'You are logged out.'
		redirect_to(access_login_path)
	end

end
