class MapController < ApplicationController

  def show
    respond_to do |format|
      format.html {}
      format.xml { render :text => MmlBuilder.build, :layout => false }
    end
  end
end
