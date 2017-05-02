class Option < ApplicationRecord

	belongs_to :poll
	has_many :voters, :dependent => :destroy

end
