class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.references :part, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
