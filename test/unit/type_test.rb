require File.join(File.dirname(__FILE__), '..', 'test_helper')

class TypeTest < ActiveSupport::TestCase
  def setup
    @layer = Machine.build!(:layer, :name => 'name')
  end

  test 'should validate properly' do
    t = Type.new
    assert !t.valid?
    assert t.errors.on(:name)
    t = Type.new(:name => 'blah')
    assert t.valid?
  end

  test 'should set the layer by name' do
    t = Machine(:type, :layer_name => @layer.name)
    assert_equal t.layer, @layer 
  end

  test 'should set the children by attributes' do
    t = Machine.build!(:type, :child_attributes => [{:name => 'hack'}])
    assert (t2 = Type.find_by_name('hack'))
    assert_equal t, t2.parent
  end

  test 'should have an accessor for self and children' do
    t = Machine.build!(:type, :name => 'blah', :child_attributes => [{:name => 'hack'}])
    assert_equal ['blah', 'hack'], t.self_and_children.map { |t| t.name }.sort
  end
end
