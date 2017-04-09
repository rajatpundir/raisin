class NotificationsController < ApplicationController

	before_action :confirm_logged_in
	
	#READ ACTIONS
	def index
		@notifications = Notification.all
	end

	def show
		@notification = Notification.find(params[:id])
	end

	# CREATE ACTIONS
	def new
		@notification = Notification.new
	end

	def create
		@notification = Notification.new()
		if @notification.save
			flash[:success] = "Notification created successfully"
			redirect_to(notifications_path)
		else
			flash[:danger].now = "Notification couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@notification = Notification.find(params[:id])
	end

	def update
		@notification = Notification.find(params[:id])
		if @notification.update_attributes(notification_params)
			redirect_to (notifications_path)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@notification = Notification.find(params[:id])
	end

	def destroy
		@notification = Notification.find(params[:id])
		@notification.destroy
		flash[:success] = "Notification '#{@notification.id}' deleted successfully."
		redirect_to(questions_path)
	end

	private

	def notification_params
		params.require(:notification).permit()
	end

end
