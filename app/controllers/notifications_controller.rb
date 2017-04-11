class NotificationsController < ApplicationController

	before_action :confirm_logged_in
	
	#READ ACTIONS
	def index
		@floor = Floor.find(params[:floor_id])
		@floor_id = params[:floor_id]
		@notifications = @floor.notifications
	end

	def show
		@notification = Notification.find(params[:id])
	end

	# CREATE ACTIONS
	def new
		@notification = Notification.new
		@floor_id = params[:floor_id]
	end

	def create
		@notification = Notification.new(:title => params[:notification][:title], :message => params[:notification][:message], :floor_id => params[:floor_id])
		if @notification.save
			flash[:success] = "Notification created successfully"
			redirect_to notifications_path(floor_id: params[:floor_id])
		else
			flash[:danger].now = "Notification couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@notification = Notification.find(params[:id])
		@floor_id = params[:floor_id]
	end

	def update
		@notification = Notification.find(params[:id])
		if @notification.update_attributes(notification_params)
			redirect_to notifications_path(floor_id: params[:floor_id])
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@notification = Notification.find(params[:id])
		@floor_id = params[:floor_id]
	end

	def destroy
		@notification = Notification.find(params[:id])
		@notification.destroy
		flash[:success] = "Notification '#{@notification.title}' deleted successfully."
		redirect_to notifications_path(floor_id: params[:floor_id])
	end

	private

	def notification_params
		params.require(:notification).permit(:title, :message)
	end

end
