class AddCompanyPartToAd < ActiveRecord::Migration[5.0]
  def change
    add_reference :ads, :company_part, foreign_key: true
  end
end
