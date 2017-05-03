class ObjectiveQuestion < ApplicationRecord

	belongs_to :objective_test
	has_many :fake_answers, :dependent => :destroy

end
