require File.join(File.dirname(__FILE__), '..', 'test_helper')

class LayerTest < ActiveSupport::TestCase
  
  test 'should validate properly' do
    l = Layer.new
    assert !l.valid?
    assert l.errors.on(:name)
    assert l.errors.on(:data_source)
    l = Layer.new(:data_source => DataSource.new(:name => 'blah'), :name => 'blah', :geometry_type => 'point')
  end

  test 'should set the datasource by source_name if given' do
    ds = Machine.build!(:shape_data_source, :name => 'ack')
    l = Machine.build!(:layer, :source_name => 'ack')
    assert_equal ds, l.data_source
    assert ds.valid?
  end
end
