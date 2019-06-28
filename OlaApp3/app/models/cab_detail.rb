# frozen_string_literal: true

class CabDetail < ApplicationRecord
  belongs_to :user
  belongs_to :cab
end
