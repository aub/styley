require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ShapeDataSourceTest < ActiveSupport::TestCase

  test 'should validate correctly' do
    ds = ShapeDataSource.new
    assert !ds.valid?
    assert ds.errors.on(:file)
    ds = ShapeDataSource.new(:name => 'blah', :file => 'blah')
    assert ds.valid?
  end

  test 'should produce the correct set of parameters' do
    ds = ShapeDataSource.new(:name => 'blah', :file => 'blam')
    assert_equal 'shape', ds.parameters[:type]
    assert_equal 'blam', ds.parameters[:file]
  end
end

