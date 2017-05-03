class Moderator < ApplicationRecord

	belongs_to :tower
	has_secure_password

	validates_presence_of :username, :password, :first_name, :last_name
	validates_uniqueness_of :username

	def name
		"#{first_name} #{last_name}"
	end

end
