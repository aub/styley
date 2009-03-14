class Style < ActiveRecord::Base
  belongs_to :attachment, :class_name => 'Type'

  before_validation :tweak_attributes

  def to_mss(class_name)
    result = ''
    result << style_string([class_name, 'outline'], outline_rules) if show_outline
    result << style_string([class_name, 'inline'], inline_rules) if show_inline
    result << style_string([class_name, 'labels'], label_rules, 'name') if show_labels
    result
  end

  protected

  def zoom_string
    result = '' 
    result << "[zoom<=#{top_zoom}]" unless top_zoom.blank?
    result << "[zoom>=#{bottom_zoom}]" unless bottom_zoom.blank?
    result
  end

  def inline_rules
    {
      'line-width' => inline_width,
      'line-color' => inline_color,
      'line-join' => inline_join
    }
  end

  def outline_rules
    { 
      'line-width' => outline_width,
      'line-color' => outline_color,
      'line-join' => outline_join
    }
  end

  def label_rules
    {
      'text-face-name' => label_font,
      'text-fill' => label_fill_color,
      'text-halo-radius' => label_halo_radius,
      'text-size' => label_size,
      'text-wrap-width' => label_wrap_width,
      'text-placement' => label_placement
    }
  end

  def style_string(class_names, rules, label_field=nil)
    ".#{Array(class_names).join('.')}#{zoom_string}#{attachment.filter_string} #{label_field} {\n #{rules.map { |name, value| value.blank? ? nil: "  #{name}: #{value.to_s};" }.compact.join("\n")}\n}\n\n" 
  end

  protected

  def tweak_attributes
    self.label_font = "\"#{label_font}\"" unless label_font =~ /^".*"$/
  end
end
