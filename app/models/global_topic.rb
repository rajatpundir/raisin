class GlobalTopic < ApplicationRecord

	belongs_to :tower
	has_many :global_posts, :dependent => :destroy

end
