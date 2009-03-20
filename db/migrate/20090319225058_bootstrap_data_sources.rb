class BootstrapDataSources < ActiveRecord::Migration
  def self.up
    YAML::load(File.open('config/data_sources.yml'))[RAILS_ENV].each do |name, attrs|
      type = attrs.delete('type')
      data_source = type.constantize.create(attrs.merge(:name => name))
    end
  end

  def self.down
    DataSource.all.each { |ds| ds.destroy }
  end
end
