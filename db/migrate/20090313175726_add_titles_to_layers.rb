class AddTitlesToLayers < ActiveRecord::Migration
  def self.up
    add_column :layers, :title, :string
  end

  def self.down
    remove_column :layers, :title
  end
end
