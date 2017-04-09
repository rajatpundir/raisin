class Moderator < ApplicationRecord

	belongs_to :tower
	has_many :hidden_floors, :dependent => :destroy

	has_secure_password

	validates_presence_of :username, :password, :first_name, :last_name

	validates_uniqueness_of :username

end
