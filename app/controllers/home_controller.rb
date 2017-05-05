class HomeController < ApplicationController

	before_action :confirm_logged_in

	def home_notification
		@tower = Tower.find(session[:tower_id])
		@floor = Floor.find(session[:floor_id])
		@notifications = @floor.notifications.order('notifications.created_at DESC')
	end

	def home_notification_show
		@notification = Notification.find(params[:format])
	end

	def home_tag
		@tower = Tower.find(session[:tower_id])
		@floor = Floor.find(session[:floor_id])
		@tags = @floor.tags.order('tags.created_at DESC')
	end

	def home_tag_show
		@tag = Tag.find(params[:format])
	end

end
