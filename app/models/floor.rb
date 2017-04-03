class Floor < ApplicationRecord

	belongs_to :administrator
	has_many :regulars, :dependent => :destroy
	has_many :tests, :dependent => :destroy
	has_one :forum, :dependent => :destroy
	has_many :polls, :dependent => :destroy
	has_many :tags, :dependent => :destroy
	has_many :notifications, :dependent => :destroy

end
