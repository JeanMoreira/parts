class CreatePartPromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :part_promotions do |t|
      t.integer :needed_buy
      t.integer :price_cents
      t.integer :stock_quantity
      t.references :company_part, foreign_key: true

      t.timestamps
    end
  end
end
