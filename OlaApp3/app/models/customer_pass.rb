class CustomerPass < ApplicationRecord

	belongs_to :USer
	has_one :Payment

	#id(pass_id) user_id expiry_date cvv

end
