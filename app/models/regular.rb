class Regular < ApplicationRecord

	belongs_to :floor
	belongs_to :tower
	has_many :exam_records
	has_secure_password

	validates_presence_of :username

	def name
		"#{first_name} #{last_name}"
	end

end
