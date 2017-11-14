class RemoveModelFromCar < ActiveRecord::Migration[5.0]
  def change
    remove_column :cars, :model, :string
  end
end
