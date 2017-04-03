class Question < ApplicationRecord

	belongs_to :test
	has_one :configuration
	has_many :subjectives, :dependent => :destroy
	has_many :objectives, :dependent => :destroy

end
