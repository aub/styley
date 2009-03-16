class MmlBuilder

  def self.build
    map = Map.first
    layers = Layer.find(:all, :order => 'position DESC', :conditions => ['enabled = ?', true])

    style_string = "Map { map-bgcolor: #{map.background_color}; }\n"
    layers.each do |layer|
      layer.types.each do |type|
        style_string << type_to_mss(type, layer.class_name)
      end
    end

    buffer = ''
    xml = Builder::XmlMarkup.new(:target => buffer, :indent => 0)

    xml.instruct! :xml, :version => '1.0', :encoding => 'utf-8'
    xml.Map(:srs => map.srs) do |map_tag|
      map_tag.Stylesheet { |s| s.text!(style_string) }
      layers.each do |layer|
        unless (layer.types.select { |t| t.enabled? }).empty?
          copies = []
          copies << 'outline' if layer.outline_required
          copies << 'inline' if layer.inline_required
          copies << 'fill'
          copies.each do |subclass|
            layer_to_xml(layer, map_tag, subclass)
          end
        end
      end
      layers.select { |l| l.labels_required }.each do |layer|
        unless (layer.types.select { |t| t.enabled? }).empty?
          layer_to_xml(layer, map_tag, 'labels')
        end
      end
    end
  end    

  protected

  def self.layer_to_xml(layer, builder, subclass='')
    builder.Layer(:class => "#{layer.class_name} #{subclass}".strip, :srs => layer.data_source.srs) do |layer_tag|
      layer_tag.Datasource do |data_source_tag|
        layer.parameters.each do |key, value|
          data_source_tag.Parameter(:name => key) do |p| 
            p.text!(value.to_s)
          end
        end
      end
    end
  end

  def self.type_to_mss(type, class_name)
    result = ''
    return result unless type.enabled?
    type.styles.each do |style|
      result << style.to_mss(class_name)
      result << "\n"
    end
    result
  end
end
