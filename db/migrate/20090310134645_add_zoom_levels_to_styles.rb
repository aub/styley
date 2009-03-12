class AddZoomLevelsToStyles < ActiveRecord::Migration
  def self.up
    [:polygon_styles, :line_styles, :point_styles].each do |type|
      add_column type, :top_zoom, :integer
      add_column type, :bottom_zoom, :integer
    end
  end

  def self.down
  end
end
