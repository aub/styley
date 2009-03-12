map = Map.first

style_string = "Map { map-bgcolor: #{map.background_color} }\n"
Layer.all.each do |layer|
  layer.types.each do |type|
    type.styles.each do |style|
      style_string << style.to_mss(layer.name)
      style_string << "\n"
    end
  end
end

xml.instruct! :xml, :version => '1.0', :encoding => 'utf-8'
xml.Map(:srs => map.srs) do |map_tag|
  map_tag.Stylesheet style_string
  Layer.all.each do |layer|
    if layer.all_types.find { |t| t.enabled }
      copies = []
      copies << 'outline' if layer.outline_required
      copies << 'inline' if layer.inline_required
      copies << ''
      copies.each do |subclass|
        layer.as_xml(map_tag, subclass)
      end
    end
  end
  Layer.all.select { |l| l.labels_required }.each do |layer|
    layer.as_xml(map_tag, 'labels')
  end
end

