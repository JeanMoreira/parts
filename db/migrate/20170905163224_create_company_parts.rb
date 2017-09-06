class CreateCompanyParts < ActiveRecord::Migration[5.0]
  def change
    create_table :company_parts do |t|
      t.references :company, foreign_key: true
      t.references :part, foreign_key: true

      t.timestamps
    end
  end
end
