class Regular < ApplicationRecord

	belongs_to :floor
	has_many :exam_records
	has_secure_password

	validates_presence_of :username
	validates_uniqueness_of :username

	def name
		"#{first_name} #{last_name}"
	end

end
