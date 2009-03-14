class PolygonStyle < Style
  def to_mss(class_name)
    result = ''
    result << style_string([class_name, 'fill'], 'polygon-fill' => color, 'polygon-pattern-file' => image_path(polygon_pattern_image))
    result << super
    result
  end
end
