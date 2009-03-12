class Style < ActiveRecord::Base
  belongs_to :attachment, :class_name => 'Type'

  def to_mss(class_name)
    result = ''
    result << ".#{class_name}.outline#{zoom_string} { #{outline_styles_string} }\n" if show_outline
    result << ".#{class_name}.inline#{zoom_string} { #{inline_styles_string} }\n" if show_inline
    result
  end

  protected

  def zoom_string
    result = '' 
    result << "[zoom<=#{top_zoom}]" unless top_zoom.blank?
    result << "[zoom>=#{bottom_zoom}]" unless bottom_zoom.blank?
    result
  end

  def line_styles_string
    
  end

  def inline_styles_string
    result = ''
    result << "line-width: #{inline_width}; " unless inline_width.blank?
    result << "line-color: #{inline_color}; " unless inline_color.blank?
    result << "line-join: #{inline_join}; " unless inline_join.blank?
    result
  end

  def outline_styles_string
    result = ''
    result << "line-width: #{outline_width}; " unless outline_width.blank?
    result << "line-color: #{outline_color}; " unless outline_color.blank?
    result << "line-join: #{outline_join}; " unless outline_join.blank?
    result
  end
end
