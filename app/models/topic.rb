class Topic < ApplicationRecord

	belongs_to :floor
	has_many :posts, :dependent => :destroy

end
