class AddAttachmentImageToActionItems < ActiveRecord::Migration
  def self.up
    change_table :action_items do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :action_items, :photo
  end
end
