# frozen_string_literal: true

class DriverDetail < ApplicationRecord
  belongs_to :user
  has_one :ride
end
