class HomeController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_regular

	def home_notification
		@tower = Tower.find(session[:tower_id])
		@floor = Floor.find(session[:floor_id])
		@notifications = @floor.notifications.order('notifications.created_at DESC')
	end

	def home_notification_show
		@notification = Notification.find(params[:format])
		############################################################
		############SECURITY#########CHECK##########################
		if @notification.floor.tower.id != session[:tower_id]
			redirect_to home_home_notification_path
			return
		end
		############################################################
		############################################################
	end

	def home_tag
		@tower = Tower.find(session[:tower_id])
		@floor = Floor.find(session[:floor_id])
		@tags = @floor.tags.order('tags.created_at DESC')
	end

	def home_tag_show
		@tag = Tag.find(params[:format])
		############################################################
		############SECURITY#########CHECK##########################
		if @tag.floor.tower.id != session[:tower_id]
			redirect_to home_home_tag_path
			return
		end
		############################################################
		############################################################
	end

end
