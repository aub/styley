class TypesController < ApplicationController
  def index
    @types = Type.find(:all, :conditions => ['parent_id IS NULL'])
  end

  def edit
    @type = Type.find(params[:id])
  end

  def update
    @type = Type.find(params[:id])
    if @type.update_attributes(params[:type])
      redirect_to types_path
    else
      render :action => 'edit'
    end
  end
end
