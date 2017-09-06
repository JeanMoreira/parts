class Part < ApplicationRecord
  belongs_to :car
  belongs_to :category
  has_many :company_part
end
