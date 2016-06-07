class PropertiesController < ApplicationController

private

  def property_params
    params.require(:property).permit(:title, :description, :price, :image,:city, :state, :category_id)
  end

end
