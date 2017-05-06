class NotificationsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_not_regular
	
	# READ ACTIONS
	def index
		@floor = Floor.find(params[:floor_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@floor_id = params[:floor_id]
		@notifications = @floor.notifications.order('notifications.created_at DESC')
	end

	def show
		@notification = Notification.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @notification.floor.tower.id != session[:tower_id]
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
		@notification = Notification.new
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
		@notification = Notification.new(:title => params[:notification][:title], :message => params[:notification][:message], :floor_id => @floor.id, :origin => session[:username])
		if @notification.save
			flash[:success] = "Notification created successfully"
			redirect_to notifications_path(floor_id: @floor.id)
		else
			flash[:danger].now = "Notification couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@floor = Floor.find(params[:floor_id])
		@notification = Notification.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @notification.floor.tower.id != session[:tower_id] or @notification.floor.id != @floor.id
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@floor_id = @floor.id
	end

	def update
		@notification = Notification.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @notification.floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		if @notification.update_attributes(notification_params)
			redirect_to notifications_path(floor_id: @notification.floor.id)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@notification = Notification.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @notification.floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@floor_id = @notification.floor.id
	end

	def destroy
		@notification = Notification.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @notification.floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@notification.destroy
		flash[:success] = "Notification '#{@notification.title}' deleted successfully."
		redirect_to notifications_path(floor_id: @notification.floor.id)
	end

	private

	def notification_params
		params.require(:notification).permit(:title, :message)
	end
	
end
