class Poll < ApplicationRecord

	belongs_to :floor
	has_many :options, :dependent => :destroy

end
