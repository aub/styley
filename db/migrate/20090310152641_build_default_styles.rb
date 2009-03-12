class BuildDefaultStyles < ActiveRecord::Migration
  def self.up
    Type.all.each { |type| type.send(:build_style) }
  end

  def self.down
  end
end
