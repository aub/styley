class AddFieldsToStyles < ActiveRecord::Migration
  def self.up
    add_column :styles, :show_outline, :boolean
    add_column :styles, :show_inline, :boolean
    add_column :styles, :show_labels, :boolean
    add_column :styles, :label_font, :string
    add_column :styles, :label_fill_color, :string
    add_column :styles, :label_placement, :string
    add_column :styles, :label_halo_radius, :integer
    add_column :styles, :label_size, :integer
    add_column :styles, :label_wrap_width, :integer
    add_column :styles, :label_icon_file, :string
    add_column :styles, :label_dy, :integer
    add_column :styles, :label_dx, :integer
  end

  def self.down
    [:label_dx, :label_dy, :label_icon_file, :label_wrap_width, :label_size, :label_halo_radius,
     :label_placement, :label_fill_color, :label_font, :show_labels, :show_inline, :show_outline ].each do |row|
      remove_column :styles, row
    end
  end
end
