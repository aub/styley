class ChangeLayerQueryToText < ActiveRecord::Migration
  def self.up
    add_column :layers, :query_back, :text
    Layer.all.each { |l| l.update_attribute(:query_back, l.query) }
    remove_column :layers, :query
    rename_column :layers, :query_back, :query
  end

  def self.down
    add_column :layers, :query_back, :string
    Layer.all.each { |l| l.update_attribute(:query_back, l.query) }
    remove_column :layers, :query
    rename_column :layers, :query_back, :query
  end
end
