class Ride < ApplicationRecord
	has_one :Coupon
	has_one :Rate
	belongs_to :User
	belongs_to :Shift
end
