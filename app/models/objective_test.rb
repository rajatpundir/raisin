class ObjectiveTest < ApplicationRecord

	belongs_to :floor
	has_many :objective_questions, :dependent => :destroy

end
