class PreviewImageController < ApplicationController
  def show
    xml_file = Tempfile.new('mll_export')
    xml_file.write(MmlBuilder.build)
    xml_file.flush
    File.rename(xml_file.path, xml_file.path + '.mml')
    @output_path = "images/rendered_maps/#{xml_file.path.gsub(/.*\/(.*)$/, '\1')}.png"
    system("nik2img.py -o #{RAILS_ROOT}/public/#{@output_path} -i png -p epsg:900913 --zoomto=#{params[:center_lon]},#{params[:center_lat]},#{params[:zoom_level]} -s 512,512 -m #{xml_file.path}.mml --noopen")
    respond_to do |format|
      format.js { render :json => { :path => @output_path } }
      format.html { }
    end
  end
end

