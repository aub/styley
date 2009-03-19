class BootstrapMap < ActiveRecord::Migration
  def self.up
    attrs = YAML::load(File.open('config/map.yml'))
    Map.find(:all).each { |map| map.destroy }
    Map.create(attrs)
  end

  def self.down
    Map.all.each { |map| map.destroy }
  end
end
