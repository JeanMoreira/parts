class CreateJoinTableMeberCompany < ActiveRecord::Migration[5.0]
  def change
    create_join_table :members, :companies do |t|
      # t.index [:member_id, :company_id]
      # t.index [:company_id, :member_id]
    end
  end
end
