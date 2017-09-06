class CompanyPart < ApplicationRecord
  belongs_to :company
  belongs_to :part
end
