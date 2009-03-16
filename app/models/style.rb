class Style < ActiveRecord::Base
  belongs_to :attachment, :class_name => 'Type'
  belongs_to :polygon_pattern_image, :class_name => 'Image', :dependent => :destroy
  belongs_to :point_image, :class_name => 'Image', :dependent => :destroy
  belongs_to :line_pattern_image, :class_name => 'Image', :dependent => :destroy
  belongs_to :label_shield_image, :class_name => 'Image', :dependent => :destroy
  belongs_to :label_point_image, :class_name => 'Image', :dependent => :destroy
  accepts_nested_attributes_for :polygon_pattern_image
  accepts_nested_attributes_for :point_image
  accepts_nested_attributes_for :line_pattern_image
  accepts_nested_attributes_for :label_shield_image
  accepts_nested_attributes_for :label_point_image

  before_validation :tweak_attributes

  def self.image_types
    %w(polygon_pattern_image point_image line_pattern_image label_shield_image label_point_image)
  end

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
      'line-join' => inline_join,
      'line-cap' => inline_cap,
      'line-dasharray' => inline_dasharray
    }
  end

  def outline_rules
    { 
      'line-width' => outline_width,
      'line-color' => outline_color,
      'line-join' => outline_join,
      'line-cap' => outline_cap,
      'line-dasharray' => outline_dasharray
    }
  end

  def label_rules
    {
      'text-face-name' => label_font,
      'text-fill' => label_fill_color,
      'text-halo-radius' => label_halo_radius,
      'text-size' => label_size,
      'text-wrap-width' => label_wrap_width,
      'text-placement' => label_placement,
      'point-file' => image_path(label_point_image),
      'text-dy' => label_dy,
      'text-dx' => label_dx,
      'text-halo-fill' => label_halo_fill,
      'text-max-char-angle-delta' => label_max_char_angle_delta,
      'text-min-distance' => label_min_distance,
      'text-spacing' => label_spacing
    }
  end

  def style_string(class_names, rules, label_field=nil)
    return '' unless rules.any? { |name, value| !value.blank? }
    selectors = attachment.filter_strings.map do |filter_string|
      ".#{Array(class_names).join('.')}#{zoom_string}#{filter_string}#{label_field.blank? ? '' : ' ' + label_field}"
    end.join(', ')
    "#{selectors} {\n #{rules.map { |name, value| value.blank? ? nil: "  #{name}: #{value.to_s};" }.compact.join("\n")}\n}\n\n" 
  end

  protected

  def image_path(image)
    return nil unless image && image.image && image.image.path
    "url('#{image.image.path}')"
  end

  def tweak_attributes
    self.label_font = "\"#{label_font}\"" unless (label_font.blank? || label_font =~ /^".*"$/)
    %w(polygon_pattern_image point_image line_pattern_image label_shield_image label_point_image).each do |image|
      update_attribute(image, Image.create) if send(image).nil?
    end
  end
end
