class CartPropertiesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    property = Property.find(params[:property_id])
    @cart.add_property(property.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You have booked #{pluralize(@cart.total_properties, 'space')}."
    redirect_to property_path(property)
  end


end
