class Ride < ApplicationRecord
	# has_one :Coupon
	# has_one :Rate
	
	# belongs_to :Shift
 	

	has_one :Payment

 	belongs_to :User
	belongs_to :DriverDetail
	belongs_to :Coupon


	#Ride:-
	#id user_id driver_id coupon_id distance pickup drop wait_time start_time end_time

	#Coupon:-
	#id type

end
