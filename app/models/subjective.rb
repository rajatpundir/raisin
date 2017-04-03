class Subjective < ApplicationRecord

	has_one :answer, :dependent => :destroy

end
