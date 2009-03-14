class AddPatternFilesToStyles < ActiveRecord::Migration
  def self.up
    add_column :styles, :polygon_pattern_image_id, :integer
    add_column :styles, :point_image_id, :integer
    add_column :styles, :line_pattern_image_id, :integer
    add_column :styles, :label_shield_image_id, :integer
    add_column :styles, :label_point_image_id, :integer
  end

  def self.down
    remove_column :styles, :label_point_image_id
    remove_column :styles, :label_shield_image_id
    remove_column :styles, :line_pattern_image_id
    remove_column :styles, :point_image_id
    remove_column :styles, :polygon_pattern_image_id
  end
end
