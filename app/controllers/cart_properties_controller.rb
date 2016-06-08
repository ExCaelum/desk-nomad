class CartPropertiesController < ApplicationController

  def create
    property = Property.find(params[:property_id])
    @cart.add_property(property.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You have #{pluralize(@cart.total), space)}"
    redirect_to property_path(property)
  end


end
