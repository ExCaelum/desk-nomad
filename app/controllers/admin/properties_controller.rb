class Admin::PropertiesController < Admin::BaseController

  def index
    @properties = Property.all
  end

  def edit
    @property = Property.find(params[:id])
    @categories = Category.pluck(:title).uniq
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      flash[:message] = "Property #{@property.title} updated"
      redirect_to admin_properties_path
    else
      flash.now[:error] = @property.errors.full_messages.join(", ")
      render :edit
    end
  end

private
  def property_params
    params.require(:property).permit(:title, :description, :price,
                                       :property_image, :city, :state,
                                       :category_id, :status)
  end


end
