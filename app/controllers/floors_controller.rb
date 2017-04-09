class FloorsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_administartor
	
end
