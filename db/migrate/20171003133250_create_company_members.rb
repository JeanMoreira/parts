class CreateCompanyMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :company_members do |t|
      t.references :member, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
