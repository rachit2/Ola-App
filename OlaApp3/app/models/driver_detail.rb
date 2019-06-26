class DriverDetail < ApplicationRecord
  has_one :cab_detail
  belongs_to :user
  #has_many :ride
  #id user_id license_no expiry_date Shift Status
end
