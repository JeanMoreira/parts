class RemoveAddressFromCompany < ActiveRecord::Migration[5.0]
  def change
    remove_reference :companies, :address, foreign_key: true
  end
end
