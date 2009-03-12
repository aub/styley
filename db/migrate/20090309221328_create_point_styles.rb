class CreatePointStyles < ActiveRecord::Migration
  def self.up
    create_table :point_styles do |t|
      t.string :inline_color, :outline_color
      t.float :point_size, :outline_width
      t.timestamps
    end
  end

  def self.down
    drop_table :point_styles
  end
end
