class AddLabelFieldsColumnToLayer < ActiveRecord::Migration
  def self.up
    add_column :layers, :label_fields, :string
  end

  def self.down
    remove_column :layers, :label_fields
  end
end
