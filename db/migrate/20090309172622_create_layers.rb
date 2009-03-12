class CreateLayers < ActiveRecord::Migration
  def self.up
    create_table :layers do |t|
      t.references :data_source
      t.string :query, :name, :geometry_type
      t.timestamps
    end
  end

  def self.down
    drop_table :layers
  end
end
