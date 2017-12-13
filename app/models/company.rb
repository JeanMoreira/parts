class Company < ApplicationRecord
  has_many :company_part
  has_many :company_member
end
