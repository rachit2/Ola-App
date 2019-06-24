class CabDetail < ApplicationRecord
	belongs_to :driver_detail
	belongs_to :cab

	# id cab_id driver_detail_id number_plate
end