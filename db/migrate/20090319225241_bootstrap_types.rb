class BootstrapTypes < ActiveRecord::Migration
  def self.up
    types = []
    YAML::load(File.open('config/types.yml')).each do |name, attrs|
      layer_class = attrs.delete('layer_class')
      attrs.merge!(:layer => Layer.find_by_class_name(layer_class))
      Type.create(attrs)
    end
  end

  def self.down
    Type.all.each { |t| t.destroy }
  end
end

