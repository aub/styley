class Type < ActiveRecord::Base
  belongs_to :layer
  belongs_to :parent, :class_name => 'Type'
  has_many :styles, :foreign_key => 'attachment_id'
  has_many :children, :class_name => 'Type', :foreign_key => 'parent_id'
  accepts_nested_attributes_for :styles, :allow_destroy => true

  validates_presence_of :name
  validates_uniqueness_of :name

  before_create :build_style

  def layer_name=(name)
    self.layer = Layer.find_by_name(name)
  end

  def child_attributes=(attrs)
    attrs.each { |a| children << Type.new(a.merge(:parent => self)) }
  end

  def self_and_children
    children.dup << self
  end

  def geometry_type
    (layer || parent.layer).geometry_type
  end

  protected

  def build_style
    self.styles << case (layer ? layer.geometry_type : parent.layer.geometry_type)
      when 'line': LineStyle.new
      when 'point': PointStyle.new
      when 'polygon': PolygonStyle.new
    end
  end
end

