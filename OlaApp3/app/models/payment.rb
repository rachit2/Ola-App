class Payment < ApplicationRecord


 belongs_to :Ride
#Payment:-
	#id driver_id user_id rate/km driver_charge cancel_charge Total_payment Payment_status
end
