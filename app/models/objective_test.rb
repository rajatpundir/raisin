class ObjectiveTest < ApplicationRecord

	belongs_to :floor
	has_many :objective_questions, :dependent => :destroy
	has_many :exam_records, :dependent => :destroy

end
