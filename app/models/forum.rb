class Forum < ApplicationRecord

	belongs_to :floor
	belongs_to :hidden_floor
	has_many :topics, :dependent => :destroy

end
