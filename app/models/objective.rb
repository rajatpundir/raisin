class Objective < ApplicationRecord

	belongs_to :question
	has_many :choices, :dependent => :destroy

end
