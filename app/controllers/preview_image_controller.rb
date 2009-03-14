class PreviewImageController < ApplicationController
  def show
    Dir.glob("#{RAILS_ROOT}/public/images/rendered_maps/*").each { |file| FileUtils.rm(file) }
    Dir.glob("#{RAILS_ROOT}/tml/mml_files/*").each { |file| FileUtils.rm(file) }
    FileUtils.mkdir_p("#{RAILS_ROOT}/tmp/mml_files")
    xml_file = File.new("#{RAILS_ROOT}/tmp/mml_files/mml_export_#{Time.now.to_i}_#{(rand * 1000).ceil}.mml", 'w+')
    xml_file.write(MmlBuilder.build)
    xml_file.flush
    @output_path = "images/rendered_maps/#{xml_file.path.gsub(/.*\/(.*).mml$/, '\1')}.png"
    system("nik2img.py -o #{RAILS_ROOT}/public/#{@output_path} -i png -p epsg:900913 --zoomto=#{params[:center_lon]},#{params[:center_lat]},#{params[:zoom_level]} -s 512,512 -m #{xml_file.path} --noopen")
    respond_to do |format|
      format.js { render :json => { :path => @output_path } }
      format.html { }
    end
  end
end

