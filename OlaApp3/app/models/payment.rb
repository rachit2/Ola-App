class Payment < ApplicationRecord


 #belongs_to :Ride

 belongs_to :CustomerPass

#Payment For Ride:-
	#id driver_id user_id rate/km driver_charge cancel_charge Total_payment Payment_status

#Payment for customerPass:-
	#id customer_pass_id cardNumber rate/km driver_charge cancel_charge payment_status Total_amount_paid 

end
