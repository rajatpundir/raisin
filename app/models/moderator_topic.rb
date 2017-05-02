class ModeratorTopic < ApplicationRecord

	belongs_to :tower
	has_many :moderator_posts, :dependent => :destroy

end
