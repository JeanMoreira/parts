class AddModelToCar < ActiveRecord::Migration[5.0]
  def change
    add_reference :cars, :model, foreign_key: true
  end
end
