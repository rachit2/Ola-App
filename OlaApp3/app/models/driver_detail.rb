class DriverDetail < ApplicationRecord
  has_one :Cab_Detail
  belongs_to :User
  has_many :Ride

  #id user_id license_no expiry_date Shift Status
end
