# frozen_string_literal: true

class Ride < ApplicationRecord
	belongs_to :driver_detail
  belongs_to :user
  belongs_to :coupon
end
