class ImagesController < ApplicationController
  def reset
    @image = Image.find(params[:id])
    @image.image.destroy
    @image.update_attributes(:image => nil)
    @type = Type.find(params[:type_id])
    @layer = Layer.find(params[:layer_id])
    redirect_to edit_layer_type_path(@layer, @type)
  end
end
