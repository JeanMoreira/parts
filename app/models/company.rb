class Company < ApplicationRecord
  has_and_belongs_to_many :members
  has_many :company_part
end
