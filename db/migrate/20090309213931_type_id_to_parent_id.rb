class TypeIdToParentId < ActiveRecord::Migration
  def self.up
    rename_column :types, :type_id, :parent_id
  end

  def self.down
  end
end
