class CartPropertiesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    property = Property.find(params[:property_id])
    @cart.add_property(property.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You have booked #{pluralize(@cart.total_properties, 'space')}."
    redirect_to property_path(property)
  end

  def index
    @cart
    # @properties = @cart.return_properties
  end

  def destroy
    property = Property.find(params[:prop_id])
    @cart.remove_property(property.id)
    flash[:success] = "Successfully removed #{view_context.link_to property.title, property_path(property)} from your cart."
    redirect_to cart_path
  end


end
