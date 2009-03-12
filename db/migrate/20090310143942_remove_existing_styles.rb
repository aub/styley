class RemoveExistingStyles < ActiveRecord::Migration
  def self.up
    drop_table :polygon_styles
    drop_table :line_styles
    drop_table :point_styles
  end

  def self.down
    create_table :polygon_styles do |t|
      t.string :fill_color, :inline_color, :outline_color
      t.float :inline_width, :outline_width
      t.integer :top_zoom, :bottom_zoom
      t.timestamps
    end

    create_table :point_styles do |t|
      t.string :inline_color, :outline_color
      t.float :point_size, :outline_width
      t.integer :top_zoom, :bottom_zoom
      t.timestamps
    end

    create_table :line_styles do |t|
      t.string :color, :outline_color
      t.float :width, :outline_width
      t.integer :top_zoom, :bottom_zoom
      t.timestamps
    end
  end
end
