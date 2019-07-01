class Circle < ApplicationRecord
	belongs_to :city
	has_many :cab_details
end
