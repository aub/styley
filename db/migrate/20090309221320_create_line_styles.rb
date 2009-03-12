class CreateLineStyles < ActiveRecord::Migration
  def self.up
    create_table :line_styles do |t|
      t.string :color, :outline_color
      t.float :width, :outline_width
      t.timestamps
    end
  end

  def self.down
    drop_table :line_styles
  end
end
