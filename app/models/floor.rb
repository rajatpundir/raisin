class Floor < ApplicationRecord

	belongs_to :tower
	has_many :regulars, :dependent => :destroy
	has_many :notifications, :dependent => :destroy
	has_many :tags, :dependent => :destroy
	has_many :polls, :dependent => :destroy
	has_many :topics, :dependent => :destroy
	has_many :objective_tests, :dependent => :destroy

	validates_presence_of :floorname

end
