class GetRidOfNames < ActiveRecord::Migration
  def self.up
    rename_column :layers, :name, :class
    remove_column :types, :name
  end

  def self.down
    add_column :types, :name, :string
    rename_column :layers, :class, :name
  end
end
