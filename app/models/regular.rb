class Regular < ApplicationRecord

	belongs_to :floor
	has_many :hidden_floors, :dependent => :destroy

end
