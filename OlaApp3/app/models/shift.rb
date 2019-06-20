class Shift < ApplicationRecord
  has_many :Ride
  belongs_to :Driver

end
