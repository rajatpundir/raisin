class Tower < ApplicationRecord

	has_many :moderators, :dependent => :destroy
	has_many :floors, :dependent => :destroy
	has_many :moderator_topics, :dependent => :destroy
	has_many :global_topics, :dependent => :destroy

	has_secure_password

	validates_presence_of :towername, :password

	validates_uniqueness_of :towername

end
