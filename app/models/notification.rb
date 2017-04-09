class Notification < ApplicationRecord

	belongs_to :floor
	belongs_to :hidden_floor
	
end
