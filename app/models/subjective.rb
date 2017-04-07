class Subjective < ApplicationRecord

	belongs_to :question
	has_one :answer, :dependent => :destroy

end
