class ObjectiveQuestion < ApplicationRecord

	belongs_to :objective_test
	has_many :wrong_answers, :dependent => :destroy

end
