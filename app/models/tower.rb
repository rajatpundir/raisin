class Tower < ApplicationRecord

	has_one :administrator, :dependent => :destroy

end
