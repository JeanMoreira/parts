class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :Street
      t.string :address
      t.string :district
      t.string :city
      t.integer :number
      t.string :complement
      t.string :state
      t.string :zipCode

      t.timestamps
    end
  end
end
