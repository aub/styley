class ShapeDataSource < DataSource
  validates_presence_of :file

  def parameters
    { :type => 'shape', :file => file }
  end
end
