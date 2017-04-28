class Regular < ApplicationRecord

	belongs_to :floor

	has_secure_password

	validates_presence_of :username, :password

	validates_uniqueness_of :username

end
