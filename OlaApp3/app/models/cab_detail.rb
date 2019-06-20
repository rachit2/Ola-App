class CabDetail < ApplicationRecord
	belongs_to :Driver
	belongs_to :Cab

	# id cabi_d driver_detail_id number_plate
end
