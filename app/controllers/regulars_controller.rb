class RegularsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_administrator
	
end
