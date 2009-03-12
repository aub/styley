class ChangeStyleTypeToAttachment < ActiveRecord::Migration
  def self.up
    rename_column :styles, :type_id, :attachment_id
  end

  def self.down
    rename_column :styles, :attachment_id, :type_id
  end
end
