class MapController < ApplicationController

  def show
    respond_to do |format|
      format.html {}
      format.xml { render :text => MmlBuilder.build, :layout => false }
    end
  end

  def edit
    @map = Map.first
  end

  def update
    @map = Map.first
    if @map.update_attributes(params[:map])
      redirect_to :action => 'show'
    else
      render :action => 'edit'
    end
  end
end
