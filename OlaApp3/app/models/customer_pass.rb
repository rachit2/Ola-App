class CustomerPass < ApplicationRecord

	belongs_to :user
	#has_one :payment

	#id(pass_id) user_id expiry_date cvv

end