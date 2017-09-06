class CreatePartDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :part_details do |t|
      t.integer :price_cents
      t.boolean :negotiabel
      t.integer :quantity
      t.references :company_part, foreign_key: true

      t.timestamps
    end
  end
end
