class ManagementsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_not_regular

	def index
		@tower = Tower.find(session[:tower_id])
		@moderators = @tower.moderators
		@floors = @tower.floors
		@hidden_floors = @tower.hidden_floors
	end

end
