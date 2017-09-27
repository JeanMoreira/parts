class Ad < ApplicationRecord
  belongs_to :company_part
  belongs_to :member

  monetize :price_cents # manipula a moeda de acordo com o que vc desejar
end
