class Ad < ApplicationRecord
  belongs_to :company_part
  belongs_to :member, required: false

  monetize :price_cents # manipula a moeda de acordo com o que vc desejar
end
