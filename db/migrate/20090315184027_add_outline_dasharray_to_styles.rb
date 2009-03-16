class AddOutlineDasharrayToStyles < ActiveRecord::Migration
  def self.up
    add_column :styles, :outline_dasharray, :string
  end

  def self.down
    remove_column :styles, :outline_dasharray
  end
end
