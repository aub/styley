class AddDefaultCenterSettingsToMap < ActiveRecord::Migration
  def self.up
    add_column :maps, :default_center_lat, :float
    add_column :maps, :default_center_lon, :float
  end

  def self.down
    remove_column :maps, :default_center_lon
    remove_column :maps, :default_center_lat
  end
end
