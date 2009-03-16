class PointStyle < Style
  def to_mss(class_name)
    result = super
    result << style_string([class_name, 'fill'],
      {
        'point-file' => image_path(point_image),
        'point-allow-overlap' => allow_overlap
      }
    )
    result
  end
end

