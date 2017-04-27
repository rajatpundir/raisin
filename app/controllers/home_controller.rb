class HomeController < ApplicationController

	before_action :confirm_logged_in

	def index
		@tower = Tower.find(session[:tower_id])
		@floor = Floor.find(session[:floor_id])
		@notifications = @floor.notifications
		@tags = @floor.tags
	end

end
