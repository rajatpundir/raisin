class Moderator < ApplicationRecord

	belongs_to :tower
	has_secure_password

	validates_presence_of :username

	def name
		"#{first_name} #{last_name}"
	end

end
