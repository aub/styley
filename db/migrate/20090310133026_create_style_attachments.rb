class CreateStyleAttachments < ActiveRecord::Migration
  def self.up
    create_table :style_attachments do |t|
      t.references :type
      t.integer :style_id
      t.string :style_type
      t.timestamps
    end
  end

  def self.down
    drop_table :style_attachments
  end
end
