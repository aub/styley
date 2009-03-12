class CreateDataSources < ActiveRecord::Migration
  def self.up
    create_table :data_sources do |t|
      t.string :type, :name, :file, :host, :port, :user, :password, :dbname, :extent, :srs
      t.boolean :estimate_extent
      t.timestamps
    end
  end

  def self.down
    drop_table :data_sources
  end
end
