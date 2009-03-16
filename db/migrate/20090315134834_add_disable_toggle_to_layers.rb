class AddDisableToggleToLayers < ActiveRecord::Migration
  def self.up
    add_column :layers, :enabled, :boolean, :default => true
  end

  def self.down
    remove_column :layers, :enabled
  end
end
