require File.join(File.dirname(__FILE__), '..', 'test_helper')

class PostgisDataSourceTest < ActiveSupport::TestCase

  test 'should validate correctly' do
    ds = PostgisDataSource.new
    assert !ds.valid?
    assert ds.errors.on(:host)
    assert ds.errors.on(:port)
    assert ds.errors.on(:user)
    assert ds.errors.on(:dbname)
    ds = PostgisDataSource.new(:host => 'blah', :port => 'blah', :user => 'blah', :dbname => 'blah')
  end

  test 'should return the parameters for export in a hash' do
    ds = PostgisDataSource.new(:host => 'h', :port => '123', :user => 'bob', :password => 'abc123', :dbname => 'gis', :estimate_extent => false, :extent => 'blat')
    assert_equal 'postgis', ds.parameters[:type]
    assert_equal 'h', ds.parameters[:host]
    assert_equal '123', ds.parameters[:port]
    assert_equal 'abc123', ds.parameters[:password]
    assert_equal 'gis', ds.parameters[:dbname]
    assert_equal false, ds.parameters[:estimate_extent]
    assert_equal 'blat', ds.parameters[:extent]
  end
end
