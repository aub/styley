class BootstrapLayers < ActiveRecord::Migration
  def self.up
    YAML::load(File.open('config/layers.yml')).each do |name, attrs|
      layer = Layer.create(attrs.merge(:class_name => name))
    end
  end

  def self.down
    Layer.all.each { |l| l.destroy }
  end
end

