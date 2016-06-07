class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:category_name])
  end

end
