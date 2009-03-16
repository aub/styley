class TypesController < ApplicationController

  before_filter :find_layer

  def edit
    @type = Type.find(params[:id])
  end

  def update
    @type = Type.find(params[:id])
    if @type.update_attributes(params[:type])
      # this is unfortunate, but necessary because rails' nested forms don't work with STI
      @type.styles.reload
      @type.styles.each { |style| style.update_attribute(:type, @type.style_type.name) }

      redirect_to edit_layer_path(@type.layer)
    else
      render :action => 'edit'
    end
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.create(params[:type].merge(:layer => @layer))
    if @type.valid?
      redirect_to edit_layer_path(@layer)
    else
      render :action => 'new'
    end
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    redirect_to edit_layer_path(@layer)
  end

  protected

  def find_layer
    @layer = Layer.find(params[:layer_id])
  end
end
