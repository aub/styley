class BootstrapTypes < ActiveRecord::Migration
  def self.up
    types = []
    YAML::load(File.open('config/types.yml')).each do |name, attrs|
      if (children = attrs.delete('children'))
        attrs.merge!(:child_attributes => children.map { |k,v| v.merge(:name => k) })
      end
      Type.create(attrs.merge(:name => name))
    end
  end

  def self.down
    Type.all.each { |t| t.destroy }
  end
end

