class CreateSolds < ActiveRecord::Migration[5.0]
  def change
    create_table :solds do |t|
      t.references :company_part, foreign_key: true
      t.references :member, foreign_key: true
      t.integer :price_cents
      t.integer :quantity
      t.boolean :promotion
      t.string :status

      t.timestamps
    end
  end
end
