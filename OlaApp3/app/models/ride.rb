
class Ride < ApplicationRecord
	# has_one :Coupon
	# has_one :Rate
	
	# belongs_to :Shift
 	


 	belongs_to :user
	#belongs_to :driver_detail
	belongs_to :coupon


	#has_one :Payment

	#Ride:-
	#id user_id driver_id coupon_id distance pickup drop wait_time start_time end_time

	#Coupon:-
	#id type

end
