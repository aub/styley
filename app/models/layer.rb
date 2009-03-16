class Layer < ActiveRecord::Base
  belongs_to :data_source
  has_many :types

  validates_presence_of :class_name, :data_source, :geometry_type
  validates_uniqueness_of :class_name
  validates_inclusion_of :geometry_type, :in => %w(polygon point line)

  before_validation :remove_gunk_from_query

  def source_name
    data_source ? data_source.name : nil
  end

  def source_name=(name)
    self.data_source = DataSource.find_by_name(name)
  end

  def inline_required
    !types.map { |type| type.styles }.flatten.find { |style| style.show_inline }.nil?
  end

  def outline_required
    !types.map { |type| type.styles }.flatten.find { |style| style.show_outline }.nil?
  end

  def labels_required
    !types.map { |type| type.styles }.flatten.find { |style| style.show_labels }.nil?
  end

  def parameters
    query.blank? ? data_source.parameters : data_source.parameters.merge(:table => query)
  end

  protected

  def remove_gunk_from_query
    self.query = query.gsub("\n", ' ').gsub("\r", ' ').gsub(/\s+/, ' ') unless query.nil?
  end
end
