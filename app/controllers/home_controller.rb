class HomeController < ApplicationController

	before_action :confirm_logged_in

	def home_notification
		@tower = Tower.find(session[:tower_id])
		@floor = Floor.find(session[:floor_id])
		@notifications = @floor.notifications
	end

	def home_tag
		@tower = Tower.find(session[:tower_id])
		@floor = Floor.find(session[:floor_id])
		@tags = @floor.tags
	end

end
