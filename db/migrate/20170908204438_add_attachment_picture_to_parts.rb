class AddAttachmentPictureToParts < ActiveRecord::Migration
  def self.up
    change_table :parts do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :parts, :picture
  end
end
