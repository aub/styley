class AddEvenMoreStyleFields < ActiveRecord::Migration
  def self.up
    add_column :styles, :line_join, :string
    add_column :styles, :line_cap, :string
    add_column :styles, :line_dasharray, :string
    add_column :styles, :line_opacity, :float
    add_column :styles, :outline_join, :string
    add_column :styles, :outline_cap, :string
    add_column :styles, :inline_dasharray, :string
    add_column :styles, :inline_join, :string
    add_column :styles, :allow_overlap, :boolean
    add_column :styles, :pattern_file, :string
    add_column :styles, :label_halo_fill, :string
    add_column :styles, :label_max_char_angle_delta, :integer
    add_column :styles, :label_min_distance, :integer
    add_column :styles, :label_spacing, :integer
    add_column :styles, :shield_font, :string
    add_column :styles, :shield_min_distance, :integer
    add_column :styles, :shield_size, :integer
    add_column :styles, :shield_fill_color, :string
    add_column :styles, :shield_file, :string
    rename_column :styles, :fill_color, :color
  end

  def self.down
    rename_column :styles, :color, :fill_color
    [:shield_file, :shield_fill_color, :shield_size, :shield_min_distance, :shield_font, :label_spacing,
     :label_min_distance, :label_max_char_angle_delta, :label_halo_fill, :pattern_file, :allow_overlap, :inline_join,
     :inline_dasharray, :outline_cap, :outline_join, :line_opacity, :line_dasharray, :line_cap, :line_join].each do |column|
      remove_column :styles, column
     end
  end
end
