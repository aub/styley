require File.join(File.dirname(__FILE__), '..', 'test_helper')

class DataSourceTest < ActiveSupport::TestCase

  test 'should validate correctly' do
    ds = DataSource.create
    assert !ds.valid?
    assert ds.errors.on(:name)
    ds = DataSource.create(:name => 'blah')
    assert ds.valid?
  end

  test 'should set an extent if not set by default' do
    ds = DataSource.create(:name => 'blah')
    assert_equal '-20037508,-19929239,20037508,19929239', ds.extent
  end

  test 'should set a SRS by default if not set' do
    ds = DataSource.create(:name => 'blah')
    assert_equal '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs +over', ds.srs 
  end

  test 'should set estimate_extent to false if not set' do
    ds = DataSource.create(:name => 'blah')
    assert_equal false, ds.estimate_extent
  end
end
