class PropertiesController < ApplicationController

  def index
    @properties = Property.active
    @categories = Category.pluck(:title).uniq
    @property_cities = @properties.pluck(:city).uniq
  end

  def new
    @property = Property.new
  end

  def create
    @category = Category.find_by(title: params[:property][:category])
    @property = @category.properties.create(property_params)
    if @property.save
      flash[:success] = "Property Created Sucessfully"
      redirect_to properties_path
    else
      flash[:error] = "Property was unable to be created"
      render :new
    end
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
                                     :property_image, :city, :state,
                                     :category_id, :status)
  end

end
