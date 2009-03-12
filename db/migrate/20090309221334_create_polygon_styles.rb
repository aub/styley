class CreatePolygonStyles < ActiveRecord::Migration
  def self.up
    create_table :polygon_styles do |t|
      t.string :fill_color, :inline_color, :outline_color
      t.float :inline_width, :outline_width
      t.timestamps
    end
  end

  def self.down
    drop_table :polygon_styles
  end
end
