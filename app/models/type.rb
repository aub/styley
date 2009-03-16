class Type < ActiveRecord::Base
  belongs_to :layer
  has_many :styles, :foreign_key => 'attachment_id', :dependent => :destroy
  accepts_nested_attributes_for :styles, :allow_destroy => true

  before_create :build_style

  def geometry_type
    layer.geometry_type
  end

  def style_type
    "#{geometry_type.capitalize}Style".constantize
  end

  def build_style
    style = style_type.new
    Style.image_types.each do |image_type|
      style.send("#{image_type}=", Image.new)
    end
    style
  end

  def filter_strings
    strings = []
    strings << filters.split(',').map { |filter| "[#{filter}]" }.join('') if filters
    strings << strings[0].gsub(/(.*)=yes/, '\1=true')
    strings << strings[0].gsub(/(.*)=true/, '\1=yes')
    strings.uniq
  end
end

