class RemovePartFromAd < ActiveRecord::Migration[5.0]
  def change
    remove_reference :ads, :part, foreign_key: true
  end
end
