class Moderator < ApplicationRecord

	belongs_to :administrator
	has_many :hidden_floors, :dependent => :destroy
	has_many :forums, :dependent => :destroy
	has_many :tests, :dependent => :destroy
	has_many :polls, :dependent => :destroy
	has_many :notifications, :dependent => :destroy
	has_many :tags, :dependent => :destroy

	has_secure_password

end
