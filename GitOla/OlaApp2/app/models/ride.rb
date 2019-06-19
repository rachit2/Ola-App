class Ride < ApplicationRecord
	has_one :coupon
	has_one :rate
	belongs_to :customer
	belongs_to :shift
end
