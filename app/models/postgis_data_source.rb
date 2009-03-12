class PostgisDataSource < DataSource
  validates_presence_of :host, :port, :user, :dbname 

  def parameters
    {:type => 'postgis', :host => host, :port => port, :user => user, :password => password, :dbname => dbname, :estimate_extent => estimate_extent, :extent => extent}
  end
end
