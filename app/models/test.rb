class Test < ApplicationRecord

	belongs_to :floor
	has_many :questions, :dependent => :destroy

end
