class City < ApplicationRecord
	has_many :circles
	has_many :users
end
