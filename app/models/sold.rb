class Sold < ApplicationRecord
  belongs_to :company_part
  belongs_to :member
end
