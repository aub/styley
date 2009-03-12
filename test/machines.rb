Machine.sequence :name do |n|
  "#{n}-name"
end

Machine.define :layer do |layer, machine|
  layer.data_source = machine.postgis_data_source
  layer.name = Machine.next(:name)
  layer.geometry_type = 'line'
  layer.query = 'SELECT something FROM something_else'
end

Machine.define :map do |map, machine|
  map.background_color = '#fee'
  map.srs = 'hack_srs'
end

Machine.define :postgis_data_source do |data_source, machine|
  data_source.name = Machine.next(:name)
  data_source.host = 'hostname'
  data_source.port = '123'
  data_source.user = 'username'
  data_source.password = 'abc-123'
  data_source.dbname = 'gis'
  data_source.extent = 'extention'
  data_source.srs = 'some_srs'
  data_source.estimate_extent = false
end

Machine.define :shape_data_source do |data_source, machine|
  data_source.name = Machine.next(:name)
  data_source.file = 'shape/file/here'
  data_source.extent = 'ohhlala'
  data_source.srs = 'another_srs'
  data_source.estimate_extent = false
end

Machine.define :style do |style, machine|
  style.attachment = machine.type
  style.fill_color = '#fff'
end

Machine.define :type do |type, machine|
  type.layer = machine.layer
  type.name = Machine.next(:name)
  type.title = 'State Borders'
  type.enabled = true
end
