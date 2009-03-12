class DataSource < ActiveRecord::Base
  has_many :layers

  validates_presence_of :name, :srs

  before_validation :set_default_srs_and_extent

  protected

  def set_default_srs_and_extent
    self.srs ||=  '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs +over'
    self.extent ||= '-20037508,-19929239,20037508,19929239'
    self.estimate_extent ||= false
    true
  end
end
