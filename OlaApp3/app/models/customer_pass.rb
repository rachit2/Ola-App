# frozen_string_literal: true

class CustomerPass < ApplicationRecord
  belongs_to :user
end
