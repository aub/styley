class Layer < ActiveRecord::Base
  belongs_to :data_source
  has_many :types

  validates_presence_of :name, :data_source, :geometry_type
  validates_uniqueness_of :name
  validates_inclusion_of :geometry_type, :in => %w(polygon point line)

  def source_name=(name)
    self.data_source = DataSource.find_by_name(name)
  end

  def all_types
    types.map { |type| type.self_and_children }.flatten
  end

  def inline_required
    !all_types.map { |type| type.styles }.flatten.find { |style| style.show_inline }.nil?
  end

  def outline_required
    !all_types.map { |type| type.styles }.flatten.find { |style| style.show_outline }.nil?
  end

  def labels_required
    !all_types.map { |type| type.styles }.flatten.find { |style| style.show_labels }.nil?
  end

  def parameters
    query.blank? ? data_source.parameters : data_source.parameters.merge(:table => query)
  end
end
