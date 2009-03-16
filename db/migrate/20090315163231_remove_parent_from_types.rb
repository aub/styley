class RemoveParentFromTypes < ActiveRecord::Migration
  def self.up
    remove_column :types, :parent_id
  end

  def self.down
    add_column :types, :parent_id, :integer
  end
end
