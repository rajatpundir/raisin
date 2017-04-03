class Test < ApplicationRecord

	belongs_to :floor, :hidden_floor
	has_many :questions, :dependent => :destroy

end
