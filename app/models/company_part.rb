class CompanyPart < ApplicationRecord
  belongs_to :company
  belongs_to :part
  has_one :part_detail, inverse_of: :company_part, dependent: :destroy
  has_one :part_promotion
  accepts_nested_attributes_for :part_detail, :part_promotion
end
