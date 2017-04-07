class Administrator < ApplicationRecord

	belongs_to :tower
	has_many :moderators, :dependent => :destroy
	has_many :floors, :dependent => :destroy
	has_many :hidden_floors, :dependent => :destroy

	has_secure_password

end
