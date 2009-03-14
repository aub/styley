class LineStyle < Style
  def to_mss(class_name)
    result = super
    result << style_string([class_name, 'fill'], 'line-color' => color, 'line-join' => line_join, 'line-width' => width)
  end
end

