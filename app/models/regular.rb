class Regular < ApplicationRecord

	belongs_to :floor
	has_many :hidden_floors, :dependent => :destroy

	has_secure_password

	validates_presence_of :username, :password

	validates_uniqueness_of :username

end
