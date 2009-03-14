class CreateDefaultImagesInSyles < ActiveRecord::Migration
  def self.up
    Style.all.each do |style|
      %w(polygon_pattern_image point_image line_pattern_image label_shield_image label_point_image).each do |image|
        style.update_attribute(image, Image.create) if style.send(image).nil?
      end
    end
  end

  def self.down
  end
end
