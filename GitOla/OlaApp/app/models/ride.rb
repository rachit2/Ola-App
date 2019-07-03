# frozen_string_literal: true

class Ride < ApplicationRecord
	has_one :payment
	belongs_to :driver_detail
  belongs_to :user
  belongs_to :coupon
end
