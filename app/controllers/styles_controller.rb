class StylesController < ApplicationController
  def new
    @type = Type.find(params[:type_id])
    @style = @type.build_style
    render :partial => 'styles/ajax_style_form', :layout => false
  end
end
