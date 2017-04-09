class HiddenFloor < ApplicationRecord

	belongs_to :tower
	belongs_to :moderator
	has_many :tests, :dependent => :destroy
	has_one :forum, :dependent => :destroy
	has_many :polls, :dependent => :destroy
	has_many :tags, :dependent => :destroy
	has_many :notifications, :dependent => :destroy

end
