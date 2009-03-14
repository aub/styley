class LayersController < ApplicationController
  def index
    @layers = Layer.find(:all, :order => 'position ASC')
  end

  def edit
    @layer = Layer.find(params[:id])
  end

  def update
    @layer = Layer.find(params[:id])
    if @layer.update_attributes(params[:layer])
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end

  def new
    @layer = Layer.new
  end

  def create
    @layer = Layer.create(params[:layer])
    if @layer.valid? 
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def sort
    params[:ids].split(',').each_with_index do |id, index|
      Layer.find(id).update_attributes(:position => index)
    end
    render :nothing => true
  end
end
