class BootstrapDataSources < ActiveRecord::Migration
  def self.up
    YAML::load(File.open('config/data_sources.yml'))[RAILS_ENV].each do |name, attrs|
      ds = DataSource.new(attrs.merge(:name => name))
      ds.type = attrs['type']
      ds.save!
    end
  end

  def self.down
    DataSource.all.each { |ds| ds.destroy }
  end
end
