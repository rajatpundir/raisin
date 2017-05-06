class TowersController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_administrator, :except => [:new, :create]

	# READ ACTIONS
	def index
		redirect_to access_logout_path
	end

	def show
		@tower = Tower.find(session[:tower_id])
	end
	
	# CREATE ACTIONS
	def new
		@tower = Tower.new
	end

	def create
		@tower = Tower.new(:towername => params[:tower][:towername], :password => params[:tower][:password])
		if @tower.save
			flash[:success] = "Tower created successfully"
			redirect_to(access_login_path)
		else
			flash[:danger].now = "Tower couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@tower = Tower.find(session[:tower_id])
	end

	def update
		@tower = Tower.find(session[:tower_id])
		if @tower.update_attributes(tower_params)
			redirect_to(access_login_path)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@tower = Tower.find(session[:tower_id])
	end

	def destroy
		@tower = Tower.find(session[:tower_id])
		@tower.destroy
		flash[:success] = "Tower '#{@tower.towername}' deleted successfully."
		redirect_to(access_login_path)
	end

	private

	def tower_params
		params.require(:tower).permit(:password)
	end

end
