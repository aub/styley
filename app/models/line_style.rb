class LineStyle < Style
  def to_mss(class_name)
    result = super
    result << style_string([class_name, 'fill'], 
      {
        'line-color' => color, 
        'line-join' => line_join, 
        'line-cap' => line_cap,
        'line-width' => width,
        'line-dasharray' => line_dasharray,
        'line-pattern-file' => image_path(line_pattern_image)
      }
    )
  end
end

