class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to property_path(property)
    else
      flash[:error] = "Updated failed!"
    end
  end

private
  def property_params
    params.require(:property).permit(:title, :description, :price,
                                     :image, :city, :state, :category_id, :status)
  end

end
