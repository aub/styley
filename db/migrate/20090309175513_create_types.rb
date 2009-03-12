class CreateTypes < ActiveRecord::Migration
  def self.up
    create_table :types do |t|
      t.references :layer, :type
      t.string :name, :filters, :title
      t.boolean :enabled, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :types
  end
end
