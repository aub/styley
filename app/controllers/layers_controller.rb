class LayersController < ApplicationController
  def index
    @layers = Layer.find(:all, :order => 'position ASC')
  end

  def edit
    @layer = Layer.find(params[:id])
  end

  def sort
    params[:ids].split(',').each_with_index do |id, index|
      Layer.find(id).update_attributes(:position => index)
    end
    render :nothing => true
  end
end
