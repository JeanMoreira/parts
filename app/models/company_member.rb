class CompanyMember < ApplicationRecord
  belongs_to :member
  belongs_to :company
end
