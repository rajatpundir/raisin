class Forum < ApplicationRecord

	belongs_to :floor
	has_many :topics, :dependent => :destroy

end
