class PolygonStyle < Style
  def to_mss(class_name)
    result = ''
    result << style_string(class_name, 'polygon-fill' => color)
    result << super
    result
  end
end
