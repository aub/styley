class Type < ActiveRecord::Base
  belongs_to :layer
  belongs_to :parent, :class_name => 'Type'
  has_many :styles, :foreign_key => 'attachment_id', :dependent => :destroy
  has_many :children, :class_name => 'Type', :foreign_key => 'parent_id', :dependent => :destroy
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

  def style_type
    "#{geometry_type.capitalize}Style".constantize
  end

  def build_style
    style_type.new
  end

  def filter_string
    filters.split(',').map { |filter| "[#{filter}]" }.join('') if filters
  end
end

