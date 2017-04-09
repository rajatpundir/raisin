class Test < ApplicationRecord

	belongs_to :floor
	belongs_to :hidden_floor
	has_many :questions, :dependent => :destroy

end
