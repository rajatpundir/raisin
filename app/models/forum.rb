class Forum < ApplicationRecord

	belongs_to :floor, :hidden_floor
	has_many :topics, :dependent => :destroy

end
