class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :maker
      t.date :year
      t.date :year_make

      t.timestamps
    end
  end
end
