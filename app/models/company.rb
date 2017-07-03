class Company < ApplicationRecord
	belongs_to :address
	has_and_belongs_to_many :members
end
