class Car < ApplicationRecord
	has_many :parts
	belongs_to :model
end
