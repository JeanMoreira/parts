class Part < ApplicationRecord
  belongs_to :car
  belongs_to :category
end
