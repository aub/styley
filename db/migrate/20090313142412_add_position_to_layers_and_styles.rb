class AddPositionToLayersAndStyles < ActiveRecord::Migration
  def self.up
    add_column :layers, :position, :integer, :default => 1
    add_column :styles, :position, :integer, :default => 1
  end

  def self.down
    remove_column :layers, :position
    remove_column :styles, :position
  end
end
