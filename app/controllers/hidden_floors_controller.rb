class HiddenFloorsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_not_regular

end
