class RemoveStyleAttachments < ActiveRecord::Migration
  def self.up
    drop_table :style_attachments
  end

  def self.down
  end
end
