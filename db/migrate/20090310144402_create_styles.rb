class CreateStyles < ActiveRecord::Migration
  def self.up
    create_table :styles do |t|
      t.references :type
      t.string :type
      t.string :fill_color, :inline_color, :outline_color
      t.float :inline_width, :outline_width, :width
      t.integer :top_zoom, :bottom_zoom
      t.timestamps
    end
  end

  def self.down
    drop_table :styles
  end
end
