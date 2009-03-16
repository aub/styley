class ClassNotAGoodFieldNameDuh < ActiveRecord::Migration
  def self.up
    rename_column :layers, :class, :class_name
  end

  def self.down
    rename_column :layers, :class_name, :class
  end
end
