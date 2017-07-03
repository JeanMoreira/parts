class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.references :car, foreign_key: true
      t.string :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
