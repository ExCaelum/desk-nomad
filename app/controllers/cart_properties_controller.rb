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
  end

  def destroy
    property = Property.find(params[:prop_id])
    @cart.remove_property(property.id)
    flash[:success] = "Successfully removed #{view_context.link_to property.title, property_path(property), class: "text-green"} from your cart."
    redirect_to cart_path
  end

  def update
    property = Property.find(params[:id])
    quantity = params[params[:id]].values.first.to_i
    @cart.contents[params[:id]] = quantity
    redirect_to cart_path
    flash[:sucess] = "Successfully updated quantity for #{property.title} to #{quantity}."
  end



end
