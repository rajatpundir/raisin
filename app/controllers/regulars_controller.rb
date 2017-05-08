class RegularsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_administrator
	
	# READ ACTIONS
	def index
		redirect_to access_logout_path
	end

	def show
		@regular = Regular.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @regular.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
	end

	# CREATE ACTIONS
	def new
		@floor = Floor.find(params[:floor_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@floor_id = @floor.id
		@regular = Regular.new
	end

	def create
		@floor = Floor.find(params[:floor_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@tower = @floor.tower
		if params[:regular][:username] == "admin" or @tower.moderators.find_by_username(params[:regular][:username]) != nil or @tower.regulars.find_by_username(params[:regular][:username]) != nil
			flash[:danger] = "Username not available."
			redirect_to(floor_path(params[:floor_id]))
		else
			@regular = Regular.new(:username => params[:regular][:username], :password => params[:regular][:password], :first_name => params[:regular][:first_name], :last_name => params[:regular][:last_name], :floor_id => @floor.id, :tower_id => @floor.tower.id)
			if @regular.save
				flash[:success] = "Regular created successfully."
				redirect_to(floor_path(@floor.id))
			else
				flash[:danger].now = "Regular couldn't be created."
				render 'new'
			end
		end
	end

	# UPDATE ACTIONS
	def edit
		@regular = Regular.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @regular.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
	end

	def update
		@regular = Regular.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @regular.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		if @regular.update_attributes(regular_params)
			redirect_to(floor_path(@regular.floor))
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@regular = Regular.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @regular.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
	end

	def destroy
		@regular = Regular.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @regular.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@regular.destroy
		flash[:success] = "Regular '#{@regular.username}' deleted successfully."
		redirect_to(floor_path(@regular.floor))
	end

	private

	def regular_params
		params.require(:regular).permit(:first_name, :last_name, :password)
	end

end
