class DriverDetail < ApplicationRecord
  belongs_to :Cab
  has_and_belongs_to_many :User
end
