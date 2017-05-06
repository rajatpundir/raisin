class ModeratorsController < ApplicationController

	before_action :is_administrator

	# READ ACTIONS
	def index
		@tower = Tower.find(session[:tower_id])
		@moderators = @tower.moderators.order('moderators.created_at DESC')
	end

	def show
		@moderator = Moderator.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator.tower.id != session[:tower_id]
			redirect_to moderators_path
			return
		end
		############################################################
		############################################################
	end

	# CREATE ACTIONS
	def new
		@moderator = Moderator.new
	end

	def create
		if params[:moderator][:username] == "admin" or Regular.find_by_username(params[:moderator][:username]) != nil
			flash[:danger].now = "Username not available."
			render 'new'
		else
			@moderator = Moderator.new(:username => params[:moderator][:username], :first_name => params[:moderator][:first_name], :last_name => params[:moderator][:last_name], :password => params[:moderator][:password], :tower_id => session[:user_id])
			if @moderator.save
				flash[:success] = "Moderator created successfully."
				redirect_to(moderators_path)
			else
				flash[:danger].now = "Moderator couldn't be created."
				render 'new'
			end
		end
	end

	# UPDATE ACTIONS
	def edit
		@moderator = Moderator.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator.tower.id != session[:tower_id]
			redirect_to moderators_path
			return
		end
		############################################################
		############################################################
	end

	def update
		@moderator = Moderator.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator.tower.id != session[:tower_id]
			redirect_to moderators_path
			return
		end
		############################################################
		############################################################
		if @moderator.update_attributes(moderator_params)
			redirect_to (moderators_path)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@moderator = Moderator.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator.tower.id != session[:tower_id]
			redirect_to moderators_path
			return
		end
		############################################################
		############################################################
	end

	def destroy
		@moderator = Moderator.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator.tower.id != session[:tower_id]
			redirect_to moderators_path
			return
		end
		############################################################
		############################################################
		@moderator.destroy
		flash[:success] = "Moderator '#{@moderator.username}' deleted successfully."
		redirect_to(moderators_path)
	end

	private

	def moderator_params
		params.require(:moderator).permit(:first_name,:last_name,:password)
	end
	
end
